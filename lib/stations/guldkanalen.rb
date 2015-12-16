module Station
  class Guldkanalen < Format::JSONP
    config do
      id "guldkanalen"
      url "http://dbmedia.spelasnu.se/getPlayNowApp.aspx?rid=ID1&num=1&next=0&callback=abc"
    end

    def process
      track = data["airplays"].first
      (track and { :artist => (track["Artist"]), :song => (track["Title"]) })

    end
  end
end
