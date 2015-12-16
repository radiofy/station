module Station
  class Rxtra < Format::XML
    config do
      id "1xtra"
      url "http://trackplaying.appspot.com/?brand=bbc1xtra"
    end

    def process
      artist, song = split(data.at_css("#track").try(:content).to_s)
      { :artist => (song), :song => (song) }

    end
  end
end
