# require_relative "../classes/xml"

# module Station
#   class XSPF < Base::XML
#     def process
#       artist, song = split(data.at_css("track title").try(:text))
#       return {
#         artist: artist, 
#         song: song
#       }
#     end
#   end
# end
