require_relative "../classes/xml"

module Station
  class Ordentligradio < Base::XML
    def process
      { 
        artist: data.at_css("artist").text, 
        song: data.at_css("title").text
      }
    end
  end
end