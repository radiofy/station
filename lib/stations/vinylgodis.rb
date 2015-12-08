require_relative "../classes/json"

module Station
  class Vinylgodis < Base::JSON
    def process
      { artist: data["artist"], song: data["track"] }
    end
  end
end