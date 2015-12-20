module Station
  class BanditRockStockholm < Format::MTG
    config do
      id "bandit-rock-stockholm"
      url "http://streamcontrol.mtgradio.se/api/songs/current/2?callback=callback"
    end
  end
end
