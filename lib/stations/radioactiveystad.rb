# require_relative "../classes/html"

# module Station
#   class Radioactiveystad < Format::HTML
#     def process
#       track = data.at_css("#current_song")
#       artist, song = track && split(track.text)
#       { artist: artist, song: song }
#     end
#   end
# end