module Station
  class Vinylgodis < Format::JSON
    config do
      id "vinylgodis"
      url "http://p5.radiocdn.com/player.php?hash=760188b7633d415b1f9cba992012247fdeea4903&action=getCurrentData"
    end

    def process
      { artist: data["artist"], song: data["track"] }
    end
  end
end