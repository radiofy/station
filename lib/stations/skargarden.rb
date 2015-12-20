module Station
  class Skargarden < Format::HTML
    config do
      id "skargarden"
      url "http://ice0.c12-h203.p2.qbrick.com:8090/status.xsl"
    end

    def process
      result = data.search("//div[@class='roundcont']//table[//td[contains(text(), 'SGR')]]/tr").select do |row|
        row.at_css("td").text.include?("Current Song")
      end
      track = result.first.try(:text)
      return unless track
      track = track.gsub(/Current Song:/, "")
      artist, song = split(track)
      { song: song , artist: artist }
    end
  end
end
