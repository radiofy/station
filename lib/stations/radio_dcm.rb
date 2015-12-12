# require_relative "../classes/html"

# module Station
#   class RadioDcm < Format::HTML
#     def process
#       track = data.at_css("body").content.
#         match(/ONAIR: (.+?)BEFORE:/).to_a.last
#       artist, song = track && split(track)
#       {song: song, artist: artist}
#     end
#   end
# end