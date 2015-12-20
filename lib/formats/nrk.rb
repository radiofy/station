require_relative "./xml"

module Station
  module Format
    class NRK < XML
      def data
        track = super.at_css("trackList track title").try(:text)
        song, artist = track && track.split(" med ", 2)
        artist = artist && artist.split(/\s+\+\s+/).first
        { song: song, artist: artist }
      end
    end
  end
end