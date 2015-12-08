require_relative "../classes/jsonp"

module Station
  class EastFm < Base::JSONP
    def process
      {
        song: data["airplays"].first["Title"],
        artist: data["airplays"].first["Artist"]
      }
    end
  end
end