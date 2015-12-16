module Station
  class Guldkanalen90 < Format::JSONP
    config do
      id "guldkanalen-90"
      url "http://dbmedia.spelasnu.se/getPlayNowApp.aspx?rid=ID6&num=1&next=0&callback=abc"
    end

    def process
      track = data["airplays"].first
      (track and { :artist => (track["Artist"]), :song => (track["Title"]) })

    end
  end
end
