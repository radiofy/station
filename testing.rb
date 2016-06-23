require "berg"
require "rest-client"
require "postrank-uri"
require "nokogiri"
require "levenshtein"
require "./html"
require "./extract_link"
require "pp"

url = "http://radioactiveystad.se/"
pp ExtractLink.new("aftonbladet.se").process
abort


`ls testing | grep html`.split(/\s+/).each do |file|
  puts "--------------------------"
  puts "Work: #{file}"
  data = File.read("testing/#{file}")
  doc = Nokogiri::HTML(data)

  node, distance, selector = Locate::HTML.new(data, "this").result
  puts "Selector: #{selector.inspect}"
  puts "Distance: #{distance.inspect}"
  # puts "Real selector: #{node.css_path.inspect}"

  f_node = doc.css(selector)
  puts "Manual: #{f_node.text.squeeze(" ").strip.inspect}"
  puts "Found: #{node.text.squeeze(" ").strip.inspect}"
  abort "more then one node found" if f_node.count != 1
end
