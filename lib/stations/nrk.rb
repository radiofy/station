require_relative "../classes/xml"

module Station
  class NRK < Base::XML
    def process
      track = data.at_css("trackList track title").try(:text)
      return if track && track.match(/^Neste Blir/i)
      song, artist = track && track.split(" med ", 2)
      artist = artist && artist.split(/\s+\+\s+/).first
      
      {
        song: song,
        artist: artist
      }
    end
  end
end