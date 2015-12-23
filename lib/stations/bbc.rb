module Station
  [
    "6music",
    "1xtra"
  ].each do |station|
    Class.new(Format::BBC) do
      config do
        id station
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