module Station
  class CapitalFM < Format::HTML
    config do
      id "capitalfm"
      url "http://www.capitalfm.com/london/on-air/last-10-songs/"
    end

    def process
      artist = data.at_css(".odd.first .artist").try(:text)
      song = data.at_css(".odd.first .track a").try(:text)
      { artist: artist, song: song }
    end
  end
end



