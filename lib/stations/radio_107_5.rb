module Station
  class Radio1075 < Format::MTG
    config do
      id "radio-107-5"
      url "http://www.radioplay.se/data/onair.json?q=19cad0083ea5e36bfaab0a31775c2ef9"
      exclude ["Mer musik kommer snart", "Mastermix"]
    end
  end
end
