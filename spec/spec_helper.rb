require "rspec"
require "vcr"
require_relative "../lib/stations"

RSpec.configure do |config|
  config.mock_with :rspec
  # config.extend VCR::RSpec::Macros

  # config.around(:each) do |example|
  #    options = example.metadata[:vcr] || {}
  #    if options.is_a?(Hash) and options[:record] == :skip 
  #      VCR.turned_off(&example)
  #    else
  #      name = example.metadata[:full_description].split(/\s+/, 2).join('/').underscore.gsub(/\./,'/').gsub(/[^\w\/]+/, '_').gsub(/\/$/, '')
  #      VCR.use_cassette(name, options, &example)
  #    end
  #  end
end

# VCR.configure do |c|
#   c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
#   c.hook_into :webmock
#   c.default_cassette_options = {
#     record: :all
#   }
#   c.allow_http_connections_when_no_cassette = false


# end

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