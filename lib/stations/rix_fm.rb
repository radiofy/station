module Station
  class RixFm < Format::MTG
    config do
      id "rix-fm"
      url "http://streamcontrol.mtgradio.se/api/songs/current/3?callback=callback"
    end
  end
end
