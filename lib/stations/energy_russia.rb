module Station
  class EnergyRussia < Format::JSON
    config do
      id "energy-russia"
      url "http://www.energyfm.ru/api/getplayingtrackinfo.php?station_id=101"
      exclude ["ENERGY"]
    end

    def process
      track = data["result"]
      return unless track
      song = track["title"]
      artist = track["about"]["executor_title"]
      { artist: artist, song: song }
    end
  end
end