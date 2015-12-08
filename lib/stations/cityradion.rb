require_relative "../classes/html"

module Station
  class Cityradion < Base::HTML
    def process
      artist = data.at_css(".F1:nth-child(2) b").text
      song = data.at_css(".F1:nth-child(3) b").text
      { artist: artist, song: song }
    end
  end
end