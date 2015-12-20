module Station
  class RadioAfLundsStudentradio < Format::JSON
    config do
      id "radio-af-lunds-studentradio"
      url "http://linus.af.lu.se/api/?single"
    end

    def process
      { artist: (data["data"]["artist"]), song: (data["data"]["song"]) }
    end
  end
end
