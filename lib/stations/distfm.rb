require_relative "../classes/html"

module Station
  class Distfm < Base::HTML
    def process
      track = data.at_css("body").content.match(/Spelas Nu: (.+)$/).to_a.last
      artist, song = track && split(track)
      {song: song, artist: artist}
    end
  end
end