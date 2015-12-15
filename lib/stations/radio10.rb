module Station
  class Radio10 < Format::HTML
    config do
      id "radio10"
      url "http://radio10.nl/nowonair/nuopradio10.html"
    end

    def process
      artist = data.at_css(":nth-child(1) h3").try(:text)
      song = data.at_css(":nth-child(1) p").try(:text)
      { song: song, artist: artist }
    end
  end
end