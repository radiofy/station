module Station
  class Radio1 < Format::JSONP
    config do
      id "radio1"
      url "http://streamcontrol.mtgradio.se/api/songs/current/1?callback=callback"
    end

    def process
      { song: data["title"], artist: data["artist"] }
    end
  end
end
