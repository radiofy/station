require_relative "./html"

module Station
  module Format
    class Shoutcast < HTML
      def data
        return unless tr = super.css("tr").select do |tr|
          !! tr.to_s.match(/Current Song: /)
        end.first
        return unless track = tr.at_css("font.default b")
        artist, song = split(track.content.to_s)
        { artist: artist, song: song }
      end
    end
  end
end