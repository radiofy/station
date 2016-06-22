require "berg"
require "rest-client"
require "postrank-uri"
require "nokogiri"
require "levenshtein"

class ExtractLink
  attr_reader :url
  def initialize(url)
    @url = PostRank::URI.normalize(url)
  end

  def process
    json["log"]["entries"].each_with_object([]) do |e, res|
      url = e["request"]["url"]
      res << url if valid_url?(url)
    end
  end

  private

  def sniff
    "./netsniff.js"
  end

  def valid_url?(url)
    [
      "fbcdn",
      "fbstatic",
      "gstatic",
      "google",
      "facebook"
    ].all?{ |r| not url.match(r) }
  end

  def json
    JSON.parse(`phantomjs #{sniff} #{url} 2> /dev/null`)
  end
end

url = "http://radioactiveystad.se/"
# ExtractLink.new()
doc = Nokogiri::HTML(File.read("index.html"))

# result = []
# doc.traverse do |node|
#   if node.text.to_s.match(/BOYS/)
#     puts "OOKOKOKOK"
#   end
#   print node.attr("class")
#   result << node
# end

require "pp"
$name = "SHAFT"
def traverse(node, distance = [nil, 1_000_000])
  if node.children.empty?
    if node.text?
      dist = c_distance(node.text, $name)
      if dist < distance[1]
        distance = [node.css_path, dist]
      end
    end
  else
    node.children.each do |child|
      n_path, n_dist = traverse(child, distance)
      if n_dist < distance[1]
        distance = [n_path, n_dist]
      end
    end
  end

  distance
end


def c_distance(text, comp)
  res = []
  text.to_s.split(/\s+/).each do |t1|
    # comp.split(/\s+/).each do |t2|
      res << (a = Levenshtein.normalized_distance(t1.downcase, comp.downcase))
      if a == 0
        p [t1.downcase, comp]
      end
    # end
  end

  res << Levenshtein.normalized_distance(text.to_s.strip.downcase, comp.downcase)
  res.sort.first
end

path, distance = traverse(doc)
puts "PATH: #{path}"
puts "DISTANCE: #{distance}"
puts "MATCH: #{doc.at_css(path).text.inspect}"
puts "Trying to find: #{$name}"
abort
result = []

doc.xpath("//").each do |tr|
  hash = {}
  tr.children.each do |node|
    hash[node.node_name] = node.content
  end
  result << hash
end
puts result.inspect

# result
