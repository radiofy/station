# module Station
#   class DigsterTop30 < Format::JSONP
#     config do
#       id "digster-top-30"
#       url "http://static.radioplay.se/data/all_dk.jsonp"
#     end

#     def process
#       return unless raw = data[args.fetch(:id)]
#       {
#         song: raw["title"].try(:gsub, /^Pi?\d+ - /i, ""), 
#         artist: raw["artist"] 
#       }
#     end
#   end
# end
