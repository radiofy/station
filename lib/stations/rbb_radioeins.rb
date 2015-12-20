module Station
  class RbbRadioein < Format::HTML
    config do
      id "rbb-radioeins"
      url "http://www.radioeins.de/include/rad/nowonair/now_on_air.html"
    end

    def process
      { 
        artist: data.at_css(".artist").try(:text),
        song: data.at_css(".songtitle").try(:text)
      }
    end
  end
end
