module Station
  class Ljungbykanalen < Format::HTML
    config do
      id "ljungbykanalen"
      url "http://old.ljungbykanalen.se/playingnow.html"
    end

    def process
      track = data.
        at_css("body b").try(:text)
      track && track.gsub!(/Nu spelar vi:/, "")
      artist, song = track && split(track)
      { artist: artist, song: song }
    end
  end
end