module Station
  class Rmusic < Format::XML
    config do
      id "6music"
      url "http://trackplaying.appspot.com/?brand=bbc6music"
    end

    def process
      artist, song = split(data.at_css("#track").try(:content).to_s)
      { :artist => (song), :song => (song) }

    end
  end
end
