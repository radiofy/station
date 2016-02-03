module Station
  class Magic < Format::JSON
    config do
      id "magic"
      url "http://www.magic.co.uk/api/now-playing/"
    end

    def process
      return unless track = data.fetch("played").fetch("programme")
      { artist: track.fetch("artist"), song: track.fetch("track") }
    end
  end
end