module Station
  class Distfm < Format::HTML
    config do
      id "distfm"
      url "http://www.distfm.se/ajax/current_song.php"
    end

    def process
      track = data.at_css("body").content.match(/Spelas Nu: (.+)$/).to_a.last
      artist, song = track && split(track)
      {song: song, artist: artist}
    end
  end
end