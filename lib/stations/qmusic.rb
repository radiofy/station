module Station
  class Qmusic < Format::HTML
    config do
      id "qmusic"
      url "http://qmusic.be/playlist"
    end

    def process
      song = data.at_css(".track:nth-child(1) .track-name").try(:text)
      artist = data.at_css(".track:nth-child(1) .artist-name").try(:text)
      { artist: artist, song: song }
    end
  end
end