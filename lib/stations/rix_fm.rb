module Station
  class RixFm < Format::JSONP
    config do
      id "rix-fm"
      url "http://streamcontrol.mtgradio.se/api/songs/current/3?callback=callback"
    end

    def process
      { song: data["title"], artist: data["artist"] }
    end
  end
end
