# require_relative "../classes/raw"

# module Station
#   class OneFm < Base::Raw
#     def process
#       doc = Nokogiri::HTML(data.gsub("<!--", "").gsub("-->", ""))
#       track = doc.at_css("a.dedsngbtn")
#       artist, song = split(track.attr("data-sng"))
#       unless song == "1fm30"
#         { song: song, artist: artist }
#       end
#     end
#   end
# end