module Station
  class Goldtown < Format::HTML
    config do
      id "goldtown"
      url "http://goldtown.se/"
    end

    def process
      track = data.at_css("span.stil3").try(:text)
      artist, song = track && split(track)
      { artist: artist, song: song }
    end
  end
end