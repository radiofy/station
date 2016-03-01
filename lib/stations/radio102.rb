module Station
  class Radio102 < Format::JSON
    config do
      id "radio102"
      url "http://www.radio102.no/ajax.lastplayed.php"
    end

    def process
      { song: data["title"], artist: data["artist"] }
    end
  end
end