module Station
  [{
    id: "P1D",
    station: "dk-dr-p1"
  }, {
    id: "P2D",
    station: "dk-dr-p2"
  }, {
    id: "P3",
    station: "dk-dr-p3"
  }, {
    id: "KH4",
    station: "dk-dr-p4"
  }].each do |station|
    Class.new(Format::JSON) do
      config do
        id station.fetch(:station)
        url "http://www.dr.dk/playlister/feeds/nowNext/nowPrev.drxml?items=1&cid=#{station.fetch(:id)}"
      end

      def process
        track = data["now"]
        if track && track["status"] == "music"
          { song: track["track_title"], artist: track["display_artist"] }
        end
      end
    end
  end
end