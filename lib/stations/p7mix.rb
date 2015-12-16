module Station
  class P7mix < Format::HTML
    config do
      id "p7mix"
      url "http://www.dr.dk/playlister/p7mix"
    end

    def process
      track = data.at_css(".track:nth-child(1)")
      track && { 
        song: track.at_css(".track").try(:text),
        artist: track.at_css(".name").try(:text)
      }
    end
  end
end