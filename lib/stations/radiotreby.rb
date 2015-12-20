module Station
  class Radiotreby < Format::HTML
    config do
      id "radiotreby"
      url "http://www.radiotreby.se"
    end

    def process
       track = data.at_css("marquee").try(:text)
      _, track = track.match(/SPELAS JUST NU:(.+?)\(\d+:\d+\)/).to_a
      artist, song = (track and split(track))
      { artist: artist, song: song }
    end
  end
end
