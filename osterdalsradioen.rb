module Station
  class OsterdalsRadioen < Format::Raw
    config do
      id "osterdalsradioen"
      url "http://www.osterdalsradioen.no/spillesnaaosterdal.txt"
    end

    def process
      artist, song = (data and split(data))
      { :song => (song), :artist => (artist) }

    end
  end
end