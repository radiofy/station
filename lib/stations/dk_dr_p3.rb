# module Station
#   class DkDrP3 < Format::JSON
#     config do
#       id "dk-dr-p3"
#       url "http://www.dr.dk/playlister/feeds/nowNext/nowPrev.drxml?items=1&cid=P3"
#     end

#     def process
#       track = data["now"]
#       if (track["status"] == "music") then
#         { :song => (track["track_title"]), :artist => (track["display_artist"]) }
#       end

#     end
#   end
# end
