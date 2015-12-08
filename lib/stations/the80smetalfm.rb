require_relative "../classes/json"

module Station
  class The80smetalfm < Base::JSON
    def process
      artist, song = split(data["song"])
      { artist: artist, song: song }
    end
  end
end