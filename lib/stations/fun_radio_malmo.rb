# require_relative "../classes/raw"

# module Station
#   class FunRadioMalmo < Base::Raw
#     def process
#       track = data.match(/song\[1\]="([^"]+)"/).to_a.last
#       artist, song = track && split(track)
#       { artist: artist, song: song }
#     end
#   end
# end