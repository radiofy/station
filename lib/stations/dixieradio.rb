module Station
  class Dixieradio < Format::Raw
    config do
      id "dixieradio"
      url "https://dixieradio.radioca.st/currentsong"
    end

    def process
      artist, song = split(data)
      { artist: artist, song: song }
    end
  end
end
