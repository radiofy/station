require_relative "./jsonp"

module Station
  module Format
    class BBC < JSONP
      def data
        _, song, artist = Nokogiri::HTML(super["html"]).
          at_css("#programmes-oap-info-scroll").try(:text).to_s.match(/Playing: (.+) by (.+)/).to_a
        { song: song, artist: artist }
      end
    end
  end
end