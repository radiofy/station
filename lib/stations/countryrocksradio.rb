module Station
  class Countryrocksradio < Format::JSONP
    config do
      id "countryrocksradio"
      url "http://dbmedia.spelasnu.se/getPlayNowApp.aspx?rid=ID11&num=1&next=0&callback=abc"
    end

    def process
      track = data["airplays"].first
      (track and { :artist => (track["Artist"]), :song => (track["Title"]) })

    end
  end
end
