module Station
  class EnergyRussia < Format::JSON
    config do
      id "energy-russia"
      url "http://www.energyfm.ru/api/getplayingtrackinfo.php?station_id=101"
      exclude ["ENERGY"]
    end

    def process
      song = data["result"]["title"]
      artist = data["result"]["about"]["executor_title"]
      { artist: artist, song: song }
    end
  end
end