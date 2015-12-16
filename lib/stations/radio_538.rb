module Station
  class Radio538 < Format::HTML
    config do
      id "radio-538"
      url "http://www.538.nl/static/last3.php"
    end

    def process
      track = data.at_css("div").try(:text)
      artist, song = (track and track.strip.split("\t\t\t\t\t\t").map(&:strip))
      { :song => (song), :artist => (artist) }

    end
  end
end
