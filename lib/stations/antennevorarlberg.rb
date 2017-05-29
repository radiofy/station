module Station
  class Antennevorarlberg < Format::HTML
    config do
      id "antennevorarlberg"
      url "http://www.antennevorarlberg.at/api/onair.php"
    end

    def process
      unless content = data.at_css(".left > p")
        return nil
      end
      track = content.text.split("\n").map(&:strip)[-2]
      artist, song = track.split(/\s*:\s*/, 2)
      { artist: artist, song: song }
    end
  end
end