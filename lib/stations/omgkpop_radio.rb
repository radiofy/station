module Station
  class OmgkpopRadio < Format::XSPF
    config do
      id "omgkpop-radio"
      url "http://stream.omgkpop.com:8234/autodj.xspf"
    end

    def process
      { artist: data[:song], song: data[:artist] }
    end
  end
end
