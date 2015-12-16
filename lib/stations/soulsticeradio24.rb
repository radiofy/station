module Station
  class Soulsticeradio24 < Format::JSON
    config do
      id "soulsticeradio24"
      url "http://p5.radiocdn.com/player.php?hash=9674d030a99756a3028e66cf4bff430aa5c6b008&action=getCurrentData"
    end

    def process
      { :artist => (data["artist"]), :song => (data["track"]) }
    end
  end
end
