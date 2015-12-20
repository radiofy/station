module Station
  class Radioprime < Format::HTML
    config do
      id "radioprime"
      url "http://www.radioprime.com/sarpsborg/"
    end

    def process
      raw = data.at_css("#lastsong").to_s.match(/<strong>N\u00E5:<\/strong>(.+?)<br>/).to_a[1]
      artist, song = raw && split(raw)
      { artist: artist, song: song }
    end
  end
end
