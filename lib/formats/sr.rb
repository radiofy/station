require_relative "./xml"

module Station
  module Format
    class SR < XML
      def data
        artist = super.at_css("artist").try(:text)
        song = super.at_css("title").try(:text)
        { artist: artist, song: song }
      end
    end
  end
end