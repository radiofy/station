require_relative "../classes/json"

module Station
  class DK < Base::JSON
    def process
      track = data["now"]
      if track["status"] == "music"
        {
          song: track["track_title"],
          artist: track["display_artist"]
        }
      end
    end
  end
end