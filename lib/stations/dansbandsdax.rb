module Station
  class Dansbandsdax < Format::HTML
    config do
      id "dansbandsdax"
      url "http://www.dansbandsdax.se/player/current.asp"
    end

    def process
      track = data.at_css("#Box").content
      artist, song = (track and split(track.split("\n").last.strip))
      { :artist => (artist), :song => (song) }

    end
  end
end
