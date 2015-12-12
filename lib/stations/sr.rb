# require_relative "../classes/xml"

# module Station
#   class Sr < Base::XML
#     def process
#       artist = data.at_css("artist").try(:text)
#       song = data.at_css("title").try(:text)

#       if artist
#         artist = artist.split("&").first
#       end

#       {
#         artist: artist,
#         song: song
#       }
#     end
#   end
# end