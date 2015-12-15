module Station
  class Antenne < Format::JSON
    config do
      id "antenne"
      url "http://metadata.antenne.de/antenne/last/web-aby.json"
    end

    def process
      i = data["daten"]
      artist = i["artist"]["$"]
      song = i["title"]["$"]
      { song: song, artist: artist }
    end
  end
end