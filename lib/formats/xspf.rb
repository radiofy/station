require_relative "./xml"

module Station
  module Format
    class XSPF < XML
      def data
        artist, song = split(super.at_css("track title").try(:text))
        { artist: artist, song: song }
      end
    end
  end
end