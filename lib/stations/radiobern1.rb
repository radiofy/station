# require_relative "../classes/html"

# module Station
#   class Radiobern1 < Base::HTML
#     def process
#       track = data.at_css(".item.playing.active").attr("data-d")
#       artist, song = split(track.gsub(/^\d+:\d+\s*/, ""))
#       { artist: artist, song: song }
#     end
#   end
# end