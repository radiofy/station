require_relative "./jsonp"

module Station
  module Format
    class MTG < Format::JSON
      def process(id)
        if id.nil?
          abort "No data passed to MTG.process()"
        end

        unless row = data.detect { |row| row["id"] == id }
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