module Station
  class LugnaFavoriter < Format::JSONP
    config do
      id "lugna-favoriter"
      url "http://streamcontrol.mtgradio.se/api/songs/current/4?callback=callback"
    end

    def process
      { song: data["title"], artist: data["artist"] }
    end
  end
end
