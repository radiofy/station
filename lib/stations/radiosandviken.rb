module Station
  class Radiosandviken < Format::Raw
    config do
      id "radiosandviken"
      url "http://radiosandviken.se/shout.php"
    end

    def process
      artist, song = split(data)
      { song: song, artist: artist }
    end
  end
end
