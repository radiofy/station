# require_relative "../classes/raw"

# module Station
#   class Knac < Base::Raw
#     def process
#       song = data.match(/<current_song>(.+)$/).to_a[1]
#       artist = data.match(/<current_artist>(.+)$/).to_a[1]
#       { song: song, artist: artist }
#     end
#   end
# end