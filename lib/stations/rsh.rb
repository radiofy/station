module Station
  class RSH < Format::JSON
    config do
      id "rsh"
      url "http://www.rsh.de/iris-flow-live.json"
    end

    def process
      return unless track = data.fetch("result").fetch("entry").last
      return unless song = track.fetch("song").fetch("entry").first
      return unless artist = song.fetch("artist").fetch("entry").first
      { song: song.fetch("title"), artist: artist.fetch("name") }
    end
  end
end
