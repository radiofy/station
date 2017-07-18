module Station
  class TrysilRadioen < Format::Raw
    config do
      id "trysilradioen"
      url "http://trysilradioen.no/spillesnaatrysil.txt"
    end

    def process
      artist, song = (data and split(data))
      { :song => (song), :artist => (artist) }

    end
  end
end