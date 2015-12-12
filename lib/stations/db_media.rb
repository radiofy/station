# require_relative "../classes/jsonp"

# module Station
#   class DBMedia < Format::JSONP
#     def process
#       track = data["airplays"].first
#       track && { artist: track["Artist"], song: track["Title"] }
#     end
#   end
# end