# require_relative "../classes/raw"

# module Station
#   class Skyradio < Base::XML
#     def process
#       song = data.at_css("[name=cue_title]").text
#       artist = data.at_css("[name=track_artist_name]").text
#       { song: song, artist: artist }
#     end
#   end
# end