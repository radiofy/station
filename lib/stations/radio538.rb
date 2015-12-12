# require_relative "../classes/html"

# module Station
#   class Radio538 < Base::HTML
#     def process
#       track = data.at_css("div").try(:text)
#       artist, song = track && track.strip.
#         split("\t\t\t\t\t\t").map(&:strip)
#       { song: song, artist: artist }
#     end
#   end
# end