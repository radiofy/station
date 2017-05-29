module Station
  class Piraterock < Format::Raw
    config do
      id "piraterock"
      url "http://www.piraterock.se/getsong.php"
    end

    def process
      # artist, song = split(data)
      # { :artist => (artist), :song => (song) }
      return nil
    end
  end
end
