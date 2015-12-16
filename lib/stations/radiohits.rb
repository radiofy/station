module Station
  class Radiohit < Format::Raw
    config do
      id "radiohits"
      url "http://www.radiohits.se/cur-song.php"
    end

    def process
      artist, song = (data and split(data))
      { :song => (song), :artist => (artist) }

    end
  end
end
