# JSON.parse(File.read(Rails.root.join("ilikeradio.json"))).each do |s|
#   station({
#     station: s.fetch("name").parameterize,
#     url: "http://unison.mtgradio.se/api/v1/channel?with=currentsong&type[]=live&type[]=playlist",
#     worker: "StationJob::JSON",
#     args: { id: s.fetch("id") }
#   }) do
#     data   = c.select{ |ss| ss.fetch("id") == args.fetch(:id) }.first
#     track  = data && data.fetch("currentsong").fetch("song")
#     artist = track && track.fetch("artist_name")
#     song   = track && track.fetch("title")
#     { artist: artist, song: song }
#   end
# end