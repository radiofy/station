module Station
  class Radiosiljan < Format::HTML
    config do
      id "radiosiljan"
      url "http://www.radiosiljan.com/current.html"
    end

    def process
      _, artist, song = data.at_css("body").to_s.match(/<\/b>(.+?) - (.+?)<br>/m).to_a
      { :artist => (artist), :song => (song) }

    end
  end
end
