module Station
  class Radioroslagen < Format::HTML
    config do
      id "radioroslagen"
      url "http://radioroslagen.se/"
    end

    def process
      artist, song = split(data.at_css(".frontpage-onair span").text)
      { :artist => (artist), :song => (song) }

    end
  end
end
