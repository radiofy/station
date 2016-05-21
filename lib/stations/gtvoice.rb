module Station
  class Gtvoice < Format::HTML
    config do
      id "gtvoice"
      url "http://gtvoice.org/radiostats.php"
    end

    def process
      track = data.at_css("marquee")
      artist, song = (track and split(track.text))
      { song: song, artist: artist }
    end
  end
end
