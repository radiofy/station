module Station
  class Radiorandsfjord < Format::Raw
    config do
      id "radiorandsfjord"
      url "http://radiorandsfjord.no/spillesnaarandsfjord.txt"
    end

    def process
      artist, song = (data and split(data))
      { :song => (song), :artist => (artist) }

    end
  end
end