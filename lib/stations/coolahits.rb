module Station
  class Coolahits < Format::HTML
    config do
      id "coolahits"
      url "http://www.coolahits.se/last10_2.asp"
    end

    def process
      artist, song = split(data.css("font").last.try(:text))
      { song: song, artist: artist }
    end
  end
end