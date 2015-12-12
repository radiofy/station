# require_relative "../classes/html"

# module Station
#   class LiteFm1011 < Format::HTML
#     def process
#       artist, song = split(data.at_css("p:first").text)
#       {artist: artist, song: song}
#     end
#   end
# end