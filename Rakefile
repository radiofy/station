require "bundler/gem_tasks"
require_relative "./lib/get"
require_relative "./lib/station"
require "colorize"
require "pp"

def log(station, message, color)
  puts "[#{station.config.id}] #{message.send(color)}\n"
end

task default: [:run]

task :run do
  get = Get.new
  Station.stations.each do |station|
    if ENV["STATION"] and not station.config.id.include?(ENV["STATION"])
      next log(station,"disabled", :cyan)
    end

    if station.config.disabled
      next log(station,"disabled", :black)
    end

    unless data = get.get(station)
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