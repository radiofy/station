module Station
  class LugnaFavoriter < Format::MTG
    config do
      id "lugna-favoriter"
      url "http://streamcontrol.mtgradio.se/api/songs/current/4?callback=callback"
    end
  end
end
