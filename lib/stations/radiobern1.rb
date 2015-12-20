module Station
  class Radiobern1 < Format::HTML
    config do
      id "radiobern1"
      url "http://www.radiobern1.ch/assets/webcache/timeline.html"
    end

    def process
      track = data.at_css(".item.playing.active").attr("data-d")
      artist, song = split(track.gsub(/^\d+:\d+\s*/, ""))
      { artist: artist, song: song }
    end
  end
end
