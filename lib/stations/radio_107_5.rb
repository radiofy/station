module Station
  class Radio1075 < Format::Radioplay
    config do
      id "radio-107-5"
      url "http://www.radioplay.se/radio-107-5"
      exclude ["Mer musik kommer snart", "Mastermix"]
    end
  end
end
