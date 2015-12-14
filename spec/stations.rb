def get(station)
  RestClient::Request.execute({
    method: :get, 
    url: station.config.url, 
    timeout: 5, 
    open_timeout: 5
  })
rescue RestClient::Exception, Errno::ENOTCONN
  return false
end

describe Station do
  Station.stations.each do |station|
    unless station.config.disabled
      it "should work with #{station}", :vcr do
        if data = get(station)
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