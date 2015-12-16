# module Station
#   class RadioKlassiskDk < Format::JSONP
#     config do
#       id "radio-klassisk-dk"
#       url "http://static.radioplay.se/data/all_dk.jsonp"
#     end

#     def process
#       unless data = data[args.fetch(:id)] then
#         next
#       end
#       { :song => (data["title"].try(:gsub, /^Pi?\d+ - /i, "")), :artist => (data["artist"]) }

#     end
#   end
# end
