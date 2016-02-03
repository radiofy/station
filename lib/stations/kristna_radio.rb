module Station
  class KristnaRadio < Format::JSON
    config do
      id "kristna_radio"
      url "http://p5.radiocdn.com/player.php?hash=03e4bd7548f74dbd7f580c271fffd00c88450579&action=getCurrentData"
    end

    def process
      return unless artist = data.fetch("artist")
      return unless song = data.fetch("track")
      { artist: artist, song: song }
    end
  end
end


