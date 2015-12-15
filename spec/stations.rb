require "http"
require "timeout"

class Get
  def initialize
    @urls = {}
  end

  def get(station)
    url = station.config.url
    Timeout::timeout(2) do
      @urls[url] ||= HTTP.get(url).to_s
    end
  rescue Errno::ENOTCONN, Errno::ECONNRESET, Errno::ENOTCONN, IOError, SocketError, Timeout::Error
    return false
  end
end

describe Station do
  get = Get.new
  Station.stations.each do |station|
    unless station.config.disabled
      it "should work with #{station.config.id}", :vcr do
        if data = get.get(station)
          if result = station.new(data).perform
            expect(result).to be_a_valid_station
          else
            skip("No data for #{station.config.id}")
          end
        else
          skip("Could not fetch #{station.config.id}")
        end
      end
    end
  end
end