module Station
  class Radioseven < Format::HTML
    config do
      id "radioseven"
      url "http://www.radioseven.se/currentsong.asp"
    end

    def process
      font = data.at_css("a font:first")
      artist, song = split(font.try(:text).to_s)
      { :artist => (artist), :song => (song) }

    end
  end
end
