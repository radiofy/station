module Station
  class Dansbandsdax < Format::HTML
    config do
      id "dansbandsdax"
      url "http://www.dansbandsdax.se/player/current.asp"
    end

    def process
      unless box = data.at_css("#Box")
        return nil
      end

      track = box.content
      artist, song = (track and split(track.split("\n").last.strip))
      { :artist => (artist), :song => (song) }

    end
  end
end
