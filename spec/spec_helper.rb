require "rspec"
require "vcr"
require "byebug"
require "http"
require_relative "../lib/station"
require_relative "../lib/get"

RSpec.configure do |config|
  config.mock_with :rspec
end

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