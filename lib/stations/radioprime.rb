# require_relative "../classes/html"

# module Station
#   class Radioprime < Base::HTML
#     def process
#       data = data.at_css("#lastsong").to_s.
#         match(%r{<strong>Nå:</strong>(.+?)<br>}).to_a[1]
#       artist, song = data && split(data)
#       { artist: artist, song: song }
#     end
#   end
# end