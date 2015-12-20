describe Station do
  get = Get.new
  Station.stations.inject({}) do |result, station|
    if result[station.config.id]
      raise "#{station.config.id} exists more then once"
    end

    result[station.config.id] = 1
    result
  end

  Station.stations.each do |station|
    if ENV["STATION"] and not station.config.id.include?(ENV["STATION"])
      next
    end

    if station.config.disabled
      next
    end

    it "should work with #{station.config.id}" do
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