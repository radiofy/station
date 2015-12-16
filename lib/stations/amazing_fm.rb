module Station
  class AmazingFM < Format::Raw
    config do
      id "amazing-fm"
      url "http://www.radionybro.se/CurrentSong.txt"
    end

    def process
      artist, song = split(data)
      { artist: artist, song: song }
    end
  end
end