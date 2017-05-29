module Station
  class RixFm < Format::MTG
    config do
      id "rix-fm"
      url "http://unison.mtgradio.se/api/v2/channel?with=currentsong3&platform=web"
      args ["3"]
    end
  end
end
