require_relative "./html"

module Station
  module Format
    class Shoutcast < Base
      def data
        tr =  super.css("tr").select do |tr|
          !! tr.to_s.match(/Current Song: /)
        end.first
        return nil unless tr
        artist, song = split(tr.at_css("font.default b").content.to_s)
        { artist: artist, song: song }
      end
    end
  end
end