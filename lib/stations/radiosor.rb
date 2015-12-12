# require_relative "../classes/html"

# module Station
#   class Radiosor < Format::HTML
#     def process
#       track = data.at_css("span").try(:text)
#       artist, song = track && split(track)
#       { song: song, artist: artist }
#     end
#   end
# end