module Station
  class BanditRockStockholm < Format::JSONP
    config do
      id "bandit-rock-stockholm"
      url "http://streamcontrol.mtgradio.se/api/songs/current/2?callback=callback"
    end

    def process
      { :song => (data["title"]), :artist => (data["artist"]) }
    end
  end
end
