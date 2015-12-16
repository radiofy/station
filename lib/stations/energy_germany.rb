module Station
  class EnergyGermany < Format::HTML
    config do
      id "energy-germany"
      url "http://www.nrjnet.de/playlist/ShowCurrentMetadata.php?s=sachsen&t=json"
      exclude ["ENERGY"]
    end

    def process
      track = data.first
      track && { artist: track["artist"], song: track["song"] }
    end
  end
end