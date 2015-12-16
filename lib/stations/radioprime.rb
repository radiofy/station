module Station
  class Radioprime < Format::HTML
    config do
      id "radioprime"
      url "http://www.radioprime.com/sarpsborg/"
    end

    def process
      data = data.at_css("#lastsong").to_s.match(/<strong>N\u00E5:<\/strong>(.+?)<br>/).to_a[1]
      artist, song = (data and split(data))
      { :artist => (artist), :song => (song) }

    end
  end
end
