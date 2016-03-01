require_relative "./html"

module Station
  module Format
    class Radioplay < HTML
      def data
        artist = super.at_css("li:nth-child(1) span:nth-child(3)").text
        song = super.at_css(".list li:nth-child(1) span span:nth-child(1)").text
        { song: song, artist: artist }
      end
    end
  end
end