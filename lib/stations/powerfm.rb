module Station
  class Powerfm < Format::JSON
    config do
      id "powerfm"
      url "http://api.powerfm.se/"
    end

    def process
      { :song => (data["current_song"]), :artist => (data["current_artist"]) }
    end
  end
end
