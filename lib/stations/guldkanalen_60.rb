module Station
  class Guldkanalen60 < Format::JSONP
    config do
      id "guldkanalen-60"
      url "http://dbmedia.spelasnu.se/getPlayNowApp.aspx?rid=ID3&num=1&next=0&callback=abc"
    end

    def process
      track = data["airplays"].first
      (track and { :artist => (track["Artist"]), :song => (track["Title"]) })

    end
  end
end
