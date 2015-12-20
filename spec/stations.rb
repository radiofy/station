require "http"
require "timeout"
require "pp"
require "charlock_holmes/string"

class Get
  def initialize
    @urls = {}
  end

  def get(station)
    url = station.config.url
    Timeout::timeout(2) do
      @urls[url] ||= `curl --silent --compressed '#{url}'`

      detection = CharlockHolmes::EncodingDetector.detect(@urls[url])
      if detection[:encoding]
        CharlockHolmes::Converter.convert @urls[url], detection[:encoding], 'UTF-8'
      else
        @urls[url]
      end
    end
  rescue Errno::ENOTCONN, Errno::ECONNRESET, Errno::ENOTCONN, IOError, SocketError, Timeout::Error
    return false
  end
end

describe Station do
  get = Get.new
  Station.stations.each do |station|
    if ENV["STATION"] and not station.config.id.include?(ENV["STATION"])
      next
    end

    if not station.config.disabled
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
    else
      skip("#{station.config.id} is disabled")
    end
  end
end