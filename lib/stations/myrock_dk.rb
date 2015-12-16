# module Station
#   class MyrockDk < Format::JSONP
#     config do
#       id "myRock-dk"
#       url "http://static.radioplay.se/data/all_dk.jsonp"
#     end

#     def process
#       unless data = data[args.fetch(:id)]
#       { :song => (data["title"].try(:gsub, /^Pi?\d+ - /i, "")), :artist => (data["artist"]) }
#     end
#   end
# end
