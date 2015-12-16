module Station
  class EnergyBulgaria < Format::JSON
    config do
      id "energy-bulgaria"
      url "http://meta.metacast.eu/?radio=radioenergy"
      exclude ["ENERGY"]
    end

    def process
      { artist: data["current_artist"], song: data["current_song"] }
    end
  end
end