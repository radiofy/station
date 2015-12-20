module Station
  class Cityradion < Format::HTML
    config do
      id "cityradion"
      url "http://www.cityradion.nu/gismo/files/406/test/last10_5.html"
    end

    def process
      artist = data.at_css(".F1:nth-child(2) b").try(:text)
      song = data.at_css(".F1:nth-child(3) b").try(:text)
      { artist: artist, song: song }
    end
  end
end
