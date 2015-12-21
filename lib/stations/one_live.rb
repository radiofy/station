module Station
  class OneLive < Format::Raw
    config do
      id "1live"
      url "http://www.wdr.de/radio/radiotext/streamtitle_1live.txt"
      exclude ["1LIVE"]
    end

    def process
      artist, song = split(data)
      { artist: artist, song: song }
    end
  end
end