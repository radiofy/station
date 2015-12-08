require_relative "../classes/json"

module Station
  class Musikmixen < Base::JSON
    def process
      { artist: data["artist"], song: data["title"] }
    end
  end
end