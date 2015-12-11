require_relative "../lib/stations/antennevorarlberg"
require "pp"
RSpec::Matchers.define :be_a_valid_station do
  match do |actual|
    actual.is_a?(Hash) and
    (!actual[:id].blank?) and
      (!actual[:original][:song].blank?) and
      (!actual[:original][:artist].blank?) and
      (!actual[:song].blank?) and
      (!actual[:artist].blank?)
  end
end

describe Station do
  it "should work", :vcr do
    # pp Station::Unit.constants.select {|c| Class === Station::Unit.const_get(c)}
    pp Station.stations
    expect(Station::Unit::Antennevorarlberg.new.perform).to be_a_valid_station
  end
end