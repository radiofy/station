require_relative "./html"

module Station
  module Format
    class Radioplay < HTML
      def data
        raw = super.css("li:nth-child(1) span:nth-child(3) , .list li:nth-child(1) span span:nth-child(1)")
        song, artist = raw.map(&:text)
        { song: song, artist: artist }
      end
    end
  end
end