module Station
  class Radiotreby < Format::HTML
    config do
      id "radiotreby"
      url "http://www.radiotreby.se"
    end

    def process
      _, track = data.at_css("marquee").text.match(/SPELAS JUST NU:(.+?)\(\d+:\d+\)/).to_a
      artist, song = (track and split(track))
      { :artist => (artist), :song => (song) }

    end
  end
end
