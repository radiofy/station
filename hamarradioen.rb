module Station
  class HamarRadioen < Format::Raw
    config do
      id "hamarradioen"
      url "http://hamarradioen.no/spillesnaahamar.txt"
    end

    def process
      artist, song = (data and split(data))
      { :song => (song), :artist => (artist) }

    end
  end
end