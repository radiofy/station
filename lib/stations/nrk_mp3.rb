module Station
  class NRKMp3 < Format::NRK
    config do
      id "nrk-mp3"
      url "http://lyd.nrk.no/nrk_radio_mp3_mp3_m.xspf"
    end

    def process
      { artist: data[:song], song: data[:artist] }
    end
  end
end