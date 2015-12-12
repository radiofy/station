# require_relative "../classes/html"

# module Station
#   class RadioClubzone < Base::HTML
#     url "http://www.radioclubzone.com/scripts/ajxshowtrack.php"
    
#     def process
#       track = data.at_css("b").parent
#       track && track.at_css("b").remove
#       artist, song = track && split(track.text)
#       {artist: artist, song: song}
#     end
#   end
# end