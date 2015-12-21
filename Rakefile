require "bundler/gem_tasks"
require_relative "./lib/get"
require_relative "./lib/station"
require "colorize"
require "pp"
require "hirb"
require "rest-client"
require "postrank-uri"
require "progress_bar"

def log(station, message, color)
  puts "[#{station.config.id}] #{message.send(color)}\n"
end

task default: [:run]

task :run do
  get = Get.new
  Station.stations.each do |station|
    if ENV["STATION"] and not station.config.id.include?(ENV["STATION"])
      next
    end

    if station.config.disabled
      next # log(station,"disabled", :black)
    end

    unless data = get.get(station.config.url)
      next log(station,"no data found", :yellow)
    end

    begin
      unless data = station.new(data).perform
        next log(station,"could not parse", :red)
      end
    rescue
      next log(station,"error was raised #{$!.message}", :red)
    end

    unless data.is_a?(Hash)
      next log(station,"wrong return type #{data.class}", :magenta)
    end

    if data[:song].blank? and data[:artist].blank?
      next log(station,"no song and artist found", :blue)
    end

    if data[:song].blank?
      next log(station,"no song found", :white)
    end

    if data[:artist].blank?
      next log(station,"no song artist", :white)
    end

    log(station,"OK", :green)
    pp data if ENV["EXPAND"]
  end
end

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

task :validate_url do
  puts "Downloading links ..."
  links      = ExtractLink.new(ENV.fetch("url")).process
  ResultC    = Struct.new(:song, :artist, :worker, :link, :header)
  LinkC      = Struct.new(:link, :header)
  ImageC     = Struct.new(:image, :logo?)
  RejectedC  = Struct.new(:header)
  result     = []
  images     = []
  used_links = []
  rejected   = []
  puts "Found #{links.count} links"
  pb         = ProgressBar.new

  links.each do |link|
    pb.increment!

    next unless header = header(link)

    if image?(header)
      next (images << link)
    end

    unless valid?(header)
      next (rejected << header)
    end

    next unless data = get(link)

    used_links << [link, header]

    Station.stations.each do |station|
      res = station.new(data).perform rescue nil
      if valid_data?(res)
        result << ResultC.new(
          res[:song][:title], 
          res[:artist][:name], 
          worker, 
          link,
          header
        )
      end
    end
  end

  used_links = used_links.map{ |data| LinkC.new(*data) }
  images     = images.map{ |link| ImageC.new(link, !! (link =~ /logo/)) }
  rejected   = rejected.uniq.map{ |header| RejectedC.new(header) }

  extend Hirb::Console

  puts "Used links"
  table used_links, fields: [:link, :header]

  puts "Images"
  table images, fields: [:image, :logo?]

  puts "Rejected headers"
  table rejected, fields: [:header]

  if result.any?
    puts "Result"
    table result, fields: [:song, :artist, :worker, :link, :header]
  else
    puts "No results found"
  end
end

def header(url)
  RestClient.head(url, {
    timeout: 3, 
    open_timeout: 3
  }).headers[:content_type]
rescue RestClient::Exception
end

def image?(header)
  header.include?("image")
end

def valid_data?(data)
  data and 
    data[:song][:title].length < 30 and
      data[:artist][:name].length < 30
end

def plain?(header)
  header.include?("html")
end

def json?(header)
  header.include?("json")
end

def valid?(header)
  plain?(header) or json?(header)
end

def get(link)
  Get.new.get(link)
end