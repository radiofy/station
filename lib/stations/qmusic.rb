module Station
  class Qmusic < Format::HTML
    config do
      id "qmusic"
      url "http://q-music.be/"
    end

    def process
      track = data.at_css(".song_active .kader")
      artist = track && track.at_css("artist")
      song = track && track.at_css("songtitle")
      { artist: artist, song: song }
    end
  end
end