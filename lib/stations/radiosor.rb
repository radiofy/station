module Station
  class Radiosor < Format::HTML
    config do
      id "radiosor"
      url "http://www.radiosor.no/spillesnaaforside.php"
    end

    def process
      track = data.at_css("span").try(:text)
      artist, song = (track and split(track))
      { :song => (song), :artist => (artist) }

    end
  end
end
