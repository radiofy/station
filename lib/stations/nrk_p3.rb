module Station
  class NRKP3 < Format::NRKInvert
    config do
      id "nrk-p3"
      url "http://lyd.nrk.no/nrk_radio_p3_mp3_m.xspf"
      exclude ["Neste Blir"]
    end
  end
end