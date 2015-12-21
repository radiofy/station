module Station
  @@subclasses = []
  @@stations_by_url = nil

  def self.stations
    @@subclasses
  end

  def self.stations_by_url
    @@stations_by_url ||= begin
      stations.inject({}) do |result, station|
        result[station.config.url] ||= []
        result[station.config.url] << station
        result
      end
    end
  end
end

Dir[
  File.join(
    File.dirname(__FILE__),
    "formats/*.rb"
  )
].each {|file| require file }

Dir[
  File.join(
    File.dirname(__FILE__),
    "stations/*.rb"
  )
].each {|file| require file }
