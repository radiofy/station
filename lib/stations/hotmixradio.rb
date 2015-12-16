module Station
  class Hotmixradio < Format::XML
    config do
      id "hotmixradio"
      url "http://www.hotmixradio.fr/transfert/hotmixradiodance_spodtronic.xml"
    end

    def process
      { :song => (data.at_css("title").try(:content)), :artist => (data.at_css("artist").try(:content)) }
    end
  end
end
