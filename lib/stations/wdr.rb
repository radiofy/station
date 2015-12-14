module Station
  [{
    id: "wdr5",
    url: "http://www.wdr5.de/playlist136.jsp"
  }, {
    id: "wdr4",
    url: "http://www.wdr4.de/musik/titelsuche110.html"
  }, {
    id: "wdr2",
    url: "http://www.wdr2.de/musik/titelsuche100.jsp"
  }].each do |info|
    Class.new(Format::HTML) do
      config do
        id info.fetch(:id)
        url info.fetch(:url)
      end

      def process
        track = data.at_css("#searchPlaylistResult tr:nth-child(1) td")

        return unless track

        artist = track.at_css("strong").text
        song = track.text.gsub(artist, "")

        {
          song: song, 
          artist: artist
        }
      end
    end
  end
end