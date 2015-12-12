# require_relative "../classes/html"

# module Station
#   class Dansbandsdax < Base::HTML
#     def process
#       track = data.at_css("#Box").content
#       artist, song = track && split(track.split("\n").last.strip)
#       { artist: artist, song: song }
#     end
#   end
# end