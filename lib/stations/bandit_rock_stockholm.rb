module Station
  class BanditRockStockholm < Format::MTG
    config do
      id "bandit-rock-stockholm"
      url "http://unison.mtgradio.se/api/v2/channel?with=currentsong3&platform=web"
      args ["2"]
    end
  end
end
