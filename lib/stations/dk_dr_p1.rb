# module Station
#   class DkDrP1 < Format::JSON
#     config do
#       id "dk-dr-p1"
#       url "http://www.dr.dk/playlister/feeds/nowNext/nowPrev.drxml?items=1&cid=P1D"
#     end

#     def process
#       track = data["now"]
#       if (track["status"] == "music") then
#         { :song => (track["track_title"]), :artist => (track["display_artist"]) }
#       end

#     end
#   end
# end
