describe Station do
  Station.stations.each do |station|
    it "should work with #{station}", :vcr do
      expect(station.new.perform).to be_a_valid_station
    end
  end
end