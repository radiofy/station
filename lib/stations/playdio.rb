module Station
  class Playdio < Format::HTML
    config do
      id "playdio"
      url "http://www.playdio.se/currentsong_iframe.php"
    end

    def process
      doc = data
      doc.at_css("strong").remove
      track = doc.at_css("center")
      return unless track
      artist, song = split(track.try(:text))
      { artist: artist, song: song }
    end
  end
end
