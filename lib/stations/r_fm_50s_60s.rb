module Station
  class RFm50s60 < Format::Raw
    config do
      id "1-fm-50s-60s"
      url "http://www.1.fm/home/stationplaylist?id=60s_70s"
    end

    def process
      doc = Nokogiri.HTML(data.gsub("<!--", "").gsub("-->", ""))
      track = doc.at_css("a.dedsngbtn")
      artist, song = split(track.attr("data-sng"))
      { :song => (song), :artist => (artist) } unless (song == "1fm30")

    end
  end
end
