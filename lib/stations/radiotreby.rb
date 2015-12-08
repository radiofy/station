require_relative "../classes/html"

module Station
  class Radiotreby < Base::HTML
    def process
      raw = data.xpath("//td[@background='http://www.radiotreby.se/images/onair_mid.png']//marquee").text
      track = raw.match(/NU:\s+(.+?)\(.+\)/i).to_a[1]
      artist, song = track && split(track)
      {song: song, artist: artist}
    end
  end
end