module Station
  class Radio2 < Format::XML
    config do
      id "radio-2"
      url "http://trackplaying.appspot.com/?brand=bbcradio2"
    end

    def process
      artist, song = split(data.at_css("#track").try(:content).to_s)
      { :artist => (song), :song => (song) }

    end
  end
end
