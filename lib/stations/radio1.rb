module Station
  class Radio1 < Format::MTG
    config do
      id "radio1"
      url "http://streamcontrol.mtgradio.se/api/songs/current/1?callback=callback"
    end
  end
end
