module Station
  class EastFm < Format::JSONP
    config do
      id "east-fm"
      url "http://spelasnu.eastfm.se/getPlayNowApp.aspx?rid=ID1&num=50&next=0&callback=cb"
    end

    def process
      {
        song: data["airplays"].first["Title"],
        artist: data["airplays"].first["Artist"]
      }
    end
  end
end
