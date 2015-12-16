module Station
  class Radio1075 < Format::JSON
    config do
      id "radio-107-5"
      url "http://www.radioplay.se/data/onair.json?q=19cad0083ea5e36bfaab0a31775c2ef9"
    end

    def process
      { :song => (data["title"]), :artist => (data["artist"]) }
    end
  end
end
