require_relative "../classes/xml"

module Station
  class Hotmixradio < Base::XML
    def process
      {
        song: data.at_css("title").try(:content),
        artist: data.at_css("artist").try(:content)
      }
    end
  end
end