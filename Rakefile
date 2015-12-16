require "bundler/gem_tasks"
require "sourcify"
require "music_sanitizer"
require "active_support/all"
require "nokogiri"
require "colorize"
require "ruby-beautify"

# station({
#   url "http://www.slamfm.nl/media/onair.xml",
#   id "slam-fm",
#   worker: "StationJob::XML"
# }) do
#   song = c.at_css("Current titleName").try(:text)
#   artist = c.at_css("Current artistName").try(:text)
#   { song: song, artist: artist }
# end

def station(params, &block)
  name = params.fetch(:id)
  unless block
    return puts "Ignored #{name}"
  end

  source = block.to_source(strip_enclosure: true).gsub(/\bc\b/, "data")
  klass = params.fetch(:worker).split("::").last
  f_name = name.gsub("-", "_").gsub(/^\d+/, "R\\1").downcase
  m_klass = f_name.classify

code = %Q{module Station
  class #{m_klass} < Format::#{klass}
    config do
      id "#{name}"
      url "#{params.fetch(:url)}"
    end

    def process
      #{source}
    end
  end
end
}

  begin
    f_code = RubyBeautify.pretty_string(code, indent_count: 2, indent_token: " ")
  rescue
    f_code = code
  end

  File.open("lib/stations/#{f_name}.rb", "w+") do |file|
    file.write(f_code)
  end

  puts "wrote lib/stations/#{f_name}.rb"
end

task :migrate do
  require "./old.rb"
end