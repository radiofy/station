module Station
  class P4Norge < Format::JSON
    config do
      id "p4_norge"
      url "http://www.p4.no/backend/onairinformation.ashx?channel=1&items=3"
    end

    def process
      track = get(data, ".ProgramInstance.Elements[-1]")
      { song: get(track, ".TrackTitle"), artist: get(track, ".Artist.Name") }
    end
  end
end