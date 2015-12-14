module Station
  class Julradio < Format::Raw
    config do
      id "julradio"
      url "http://julradio.se/inc/now_playing.php"
    end

    def process
      artist, song = split(data)
      { artist: artist, song: song }
    end
  end
end