module Locate
  class HTML
    def initialize(content, compare)
      @doc = Nokogiri::HTML(content)
      @compare = compare.downcase.strip
    end

    def result
      shortest_path_to_node(traverse(@doc))
    end

    private

    def traverse(node, current = [nil, Float::INFINITY])
      if node.children.empty?
        if node.text?
          dist = distance_for_node(node)
          if dist < current[1]
            current = [node, dist]
          end
        end
      else
        node.children.each do |child|
          n_path, n_dist = traverse(child, current)
          if n_dist < current[1]
            current = [n_path, n_dist]
          end
        end
      end

      current
    end

    def distance_for_node(node)
      text = node.text.downcase.strip
      these = node.attributes.keys.map do |attr|
        Levenshtein.normalized_distance(node.attr(attr), @compare)
      end

      these << Levenshtein.normalized_distance(text, @compare)

      these += text.split(/\s+/).map do |value|
        Levenshtein.normalized_distance(@compare, value)
      end

      these.sort.first || 0
    end

    def build_chain_from_string(string)
      inner_build_chain_from_string(string.split(" > "))
    end

    def inner_build_chain_from_string((path, *rest), acumilator = nil)
      return [path, true, acumilator] if rest.empty?
      inner_build_chain_from_string(rest, [path, true, acumilator])
    end

    def shortest_path_to_node((node, distance))
      [
        node,
        distance,
          reduce_selectors(
            optimize_path(
              build_chain_from_string(node.css_path),
              nil,
              node
            )
        )
      ]
    end

    def reduce_selectors((path, is_strict, rest))
      reduce_selectors_inner(rest, is_strict, path)
    end

    def reduce_selectors_inner((path, is_strict, rest), is_strict_last, acumilator)
      # Do not process the last one
      return safe_join(acumilator, path, is_strict) unless rest
      right_part = chain_to_css_invert(rest)
      left_part = acumilator

      # False: {left} is not strictry followed by {right}
      new_path = safe_join(left_part, right_part, false)

      if @doc.css(new_path).one?
        reduce_selectors_inner(rest, false, acumilator)
      else
        new_acc = safe_join(acumilator, path, is_strict_last)
        reduce_selectors_inner(rest, is_strict, new_acc)
      end
    end

    def chain_to_css_invert((path, is_strict, rest))
      return path unless rest
      safe_join(path, chain_to_css_2(rest), is_strict)
    end

    def chain_to_css(acumilator, path)
      safe_join(chain_to_css_inner(acumilator), path)
    end

    def chain_block_to_css(block1, block2)
      safe_join(chain_to_css_inner(block1), chain_to_css_inner(block2))
    end

    def chain_to_css_inner((path, is_strict, rest))
      return "" if rest.nil?
      safe_join(path, chain_to_css_inner(rest), is_strict)
    end

    def safe_join(block1, block2, is_strict = true)
      join = { true => " > ", false => " " }[is_strict]
      return block1 if block2.to_s.empty?
      return block2 if block1.to_s.empty?
      block1 + join + block2
    end

    def normalize(path, is_strict, rest)
      node = @doc.at_css(chain_to_css_invert(path, is_strict, rest))

      fail "no node found" unless node

      # Replace node width id
      if id = node.attr("id")
        return true, "##{id}"
      end

      # Can't optimize nth
      return false, path if path =~ /nth/

      # Path found using klass, trucate everything before
      if klass = node.attr("class").to_s.split(/\s+/).first
        return true, ".#{klass}"
      end

      # Nothing to optimize
      return false, path
    end

    def chain_blocks((*head, rest), acumilator)
      return acumilator unless rest
      return [*head, chain_blocks(rest, acumilator)]
    end

    def chain_with_block(path, is_strict, block)
      return [path, is_strict, block]
    end

    def chain_css((path, is_strict, rest))
      return path unless rest
      safe_join(path, chain_css(rest))
    end

    def compare_nodes(n1, n2)
      n1.text.squeeze(" ").strip.downcase == n2.text.squeeze(" ").strip.downcase
    end

    def optimize_path((path, is_strict, rest), acumilator, end_node)
      # Path found as there are no more paths to traverse
      return acumilator unless path

      # Add class or id to node
      dominant, normalized_path = normalize(path, is_strict, rest)

      # Disregard every parent, if this path uniquely identifies #{end_node}
      items = @doc.css(
        chain_css(
          chain_with_block(
            normalized_path,
            is_strict,
            acumilator
          )
        )
      )

      if dominant and items.count == 1 and compare_nodes(items.first, end_node)
        return chain_with_block(normalized_path, is_strict, acumilator)
      end

      if items.empty?
        fail "nothing found using #{normalized_path}"
      end

      # Can't stop yet
      optimize_path(rest, chain_with_block(normalized_path, is_strict, acumilator), end_node)
    end
  end
end
