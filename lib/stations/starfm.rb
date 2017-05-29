module Station
  class Starfm < Format::MTG
    config do
      id "starfm"
      url "http://unison.mtgradio.se/api/v2/channel?with=currentsong3&platform=web"
      args ["94"]
    end
  end
end
