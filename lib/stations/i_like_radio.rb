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
        unless row = data.detect{ |row| row.fetch("id") == id }
          return nil
        end

        return {
          song: get(row, ".currentsong.song.title"),
          artist: get(row, ".currentsong.song.artist_name")
        }
      end
    end
  end
end