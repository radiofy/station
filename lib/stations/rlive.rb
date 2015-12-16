module Station
  class Rlive < Format::Raw
    config do
      id "1live"
      url "http://www.einslive.de/radiotext/RADIOTXT.TXT"
    end

    def process
      artist, song = data.split(" mit ", 2)
      { :artist => (artist), :song => (song) }

    end
  end
end
