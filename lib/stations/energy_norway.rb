module Station
  class EnergyNorway < Format::JSON
    config do
      id "energy-norway"
      url "http://www.nrj.no/backend/onairinformation.ashx?channel=13&items=1"
      exclude ["ENERGY"]
    end

    def process
      return unless track = data["ProgramInstance"]["Elements"].first
      song = track["TrackTitle"]
      return unless artist = track["Artist"]
      { artist: artist["Name"], song: song }
    end
  end
end