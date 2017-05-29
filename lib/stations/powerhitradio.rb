module Station
  class PowerHitRadio < Format::MTG
    config do
      id "powerhitradio"
      url "http://unison.mtgradio.se/api/v2/channel?with=currentsong3&platform=web"
      args ["6"]
    end
  end
end

