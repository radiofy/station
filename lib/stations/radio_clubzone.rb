module Station
  class RadioClubzone < Format::HTML
    config do
      id "radio-clubzone"
      url "http://www.radioclubzone.com/scripts/ajxshowtrack.php"
    end

    def process
      track = data.at_css("b").parent
      (track and track.at_css("b").remove)
      artist, song = (track and split(track.text))
      { :artist => (artist), :song => (song) }

    end
  end
end
