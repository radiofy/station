require_relative "../lib/stations/antennevorarlberg"
require "pp"

describe Station do
  it "should work", :vcr do
    pp Station::Antennevorarlberg.new.process
  end
end