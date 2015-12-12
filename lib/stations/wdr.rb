# require_relative "../classes/html"

# module Station
#   class WDR < Format::HTML
#     def process
#       track = data.at_css("#searchPlaylistResult tr:nth-child(1) td")

#       return unless track

#       artist = track.at_css("strong").text
#       song = track.text.gsub(artist, "")

#       {
#         song: song, 
#         artist: artist
#       }
#     end
#   end
# end