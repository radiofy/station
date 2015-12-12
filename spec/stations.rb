describe Station do
  Station.stations.each do |station|
    unless station.config.disabled
      it "should work with #{station}", :vcr do
        expect(station.new.perform).to be_a_valid_station
      end
    end
  end
end