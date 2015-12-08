require_relative "../classes/html"

module Station
  class Radioseven < Base::HTML
    def process
      font = data.at_css("a font:first")
      artist, song = split(font.try(:text).to_s)
      { artist: artist, song: song }
    end
  end
end