module Station
  class Ordentligradio < Format::XML
    config do
      id "ordentligradio"
      url "http://www.ordentligradio.no/nowplaying.xml"
    end

    def process
      {
        artist: data.at_css("artist").text,
        song: data.at_css("title").text
      }
    end
  end
end
