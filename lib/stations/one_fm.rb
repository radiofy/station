module Station
  [{
    url: "http://www.1.fm/home/stationplaylist?id=top40",
    id: "1-fm-top-40"
  }, {
    url: "http://www.1.fm/home/stationplaylist?id=60s_70s",
    id: "1-fm-50s-60s"
  }, {
    url: "http://www.1.fm/home/stationplaylist?id=80s_90s",
    id: "1-fm-80s-70s"
  },{
    url: "http://www.1.fm/home/stationplaylist?id=90s",
    id: "1-fm-80s-90s"
  }, {
    url: "http://www.1.fm/home/stationplaylist?id=Blues",
    id: "1-fm-blues"
  }, {
    url: "http://www.1.fm/home/stationplaylist?id=bombayBeats",
    id: "1-fm-bombay-beats"
  }, {
    url: "http://www.1.fm/home/stationplaylist?id=ChilloutLounge",
    id: "1-fm-chillout-lounge"
  }, {
    url: "http://www.1.fm/home/stationplaylist?id=Club",
    id: "1-fm-club-1"
  }, {
    url: "http://www.1.fm/home/stationplaylist?id=Country",
    id: "1-fm-country"
  }, {
    url: "http://www.1.fm/home/stationplaylist?id=Dance",
    id: "1-fm-dance"
  }, {
    url: "http://www.1.fm/home/stationplaylist?id=Jamz",
    id: "1-fm-jamz"
  }, {
    url: "http://www.1.fm/home/stationplaylist?id=HighVoltage",
    id: "1-fm-high-voltage"
  }, {
    url: "http://www.1.fm/home/stationplaylist?id=oldschool",
    id: "1-fm-adult-choice"
  }, {
    url: "http://www.1.fm/home/stationplaylist?id=Trance",
    id: "1-fm-trance"
  }].each do |station|
    Class.new(Format::Raw) do
      config do
        url station.fetch(:url)
        id station.fetch(:id)
        exclude ["1fm30"]
      end

      def process
        doc = Nokogiri::HTML(data.gsub("<!--", "").gsub("-->", ""))
        track = doc.at_css("a.dedsngbtn")
        artist, song = split(track.attr("data-sng"))
        { song: song, artist: artist }
      end
    end
  end
end