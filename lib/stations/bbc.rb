module Station
  {
    "bbc6music" => "6music",
    "bbc1xtra" => "1xtra"
  }.each_pair do |key, station|
    Class.new(Format::BBC) do
      config do
        id key
        url "http://polling.bbc.co.uk/modules/onairpanel/include/bbc_#{station}.jsonp"
      end
    end
  end
end

# TODO
# module Station
#   {
#     "bbcradio1" => "radio-1",
#     "bbcradio2" => "radio-2",
#   }.each_pair do |key, station|
#     Class.new(Format::BBC) do
#       config do
#         id key
#         url "http://polling.bbc.co.uk/modules/onairpanel/include/bbc_#{station}.jsonp"
#       end
#     end
#   end
# end