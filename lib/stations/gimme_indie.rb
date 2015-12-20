module Station
  class GimmeIndie < Format::JSON
    config do
      id "gimme-indie"
      url "http://www.gimmeindie.se/wp-content/uploads/radio/ice_meta.json"
    end

    def process
      { artist: (data["now_artist"]), song: (data["now_track"]) }
    end
  end
end
