require_relative "./html"

module Station
  module Format
    class BBC < HTML
      def data
        track = super.at_css("#track").try(:content).to_s
        return unless track
        artist, song = split(track)
        { artist: song, song: song}
      end
    end
  end
end