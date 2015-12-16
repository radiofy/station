module Station
  class RFmClub1 < Format::Raw
    config do
      id "1-fm-club-1"
      url "http://www.1.fm/home/stationplaylist?id=Club"
    end

    def process
      doc = Nokogiri.HTML(data.gsub("<!--", "").gsub("-->", ""))
      track = doc.at_css("a.dedsngbtn")
      artist, song = split(track.attr("data-sng"))
      { :song => (song), :artist => (artist) } unless (song == "1fm30")

    end
  end
end
