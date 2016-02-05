module Station
  class RadioNorge < Format::HTML
    config do
      id "radionorge"
      url "http://www.radioplay.no/radionorge"
    end

    def process
      song, artist = split(data.at_css("li:nth-child(1) span:nth-child(2)").try(:text))
      { song: song, artist: artist }
    end
  end
end
