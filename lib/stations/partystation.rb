module Station
  class Partystation < Format::HTML
    config do
      id "partystation"
      url "http://178.32.62.154:8475/"
    end

    def process
      artist, song = split(
        data.at_css("p:nth-child(11)").
        text.sub("Currently playing:", "")
      )
      { song: song, artist: artist }
    end
  end
end