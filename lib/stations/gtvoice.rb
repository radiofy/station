require_relative "../classes/html"

module Station
  class Gtvoice < Base::HTML
    def process
      track = data.at_css("marquee")
      artist, song = track && split(track.text)
      {song: song, artist: artist}
    end
  end
end