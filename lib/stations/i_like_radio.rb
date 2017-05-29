require "pp"

module Station
  data = File.read(File.join(File.dirname(__FILE__), "../lists/ilikeradio.json"))
  JSON.parse(data).each do |station|
    Class.new(Format::JSON) do
      config do
        if an_id = station["token"]
          id an_id
        else
          id station.fetch("name").parameterize
        end
        url "http://unison.mtgradio.se/api/v2/channel?with=currentsong3&platform=web"
        args [station.fetch("id")]
      end

      def process(id)
        raw   = data.select{ |ss| ss.fetch("id") == id }.first
        track  = raw && raw.fetch("currentsong").fetch("song")
        artist = track && track.fetch("artist_name")
        song   = track && track.fetch("title")
        { artist: artist, song: song }
      end
    end
  end
end