module Station
  class Powerhitradio < Format::JSON
    config do
      id "powerhitradio"
      url "http://streamcontrol.mtgradio.se/api/songs/current/6"
    end

    def process
      { :song => (data["title"]), :artist => (data["artist"]) }
    end
  end
end
