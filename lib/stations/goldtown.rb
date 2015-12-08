require_relative "../classes/html"

module Station
  class Goldtown < Base::HTML
    def process
      track = data.at_css("span.stil3").text
      artist, song = track && split(track)
      { artist: artist, song: song }
    end
  end
end