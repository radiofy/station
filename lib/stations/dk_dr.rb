module Station
  [{
    id: "p1",
    station: "dk-dr-p1"
  }, {
    id: "p2",
    station: "dk-dr-p2"
  }, {
    id: "p3",
    station: "dk-dr-p3"
  }, {
    id: "p4kbh",
    station: "dk-dr-p4"
  }, {
    id: "p4bornholm",
    station: "dk-p4bornholm"
  }, {
    id: "p4esbjerg",
    station: "dk-p4esbjerg"
  }, {
    id: "p4fyn",
    station: "dk-p4fyn",
  }, {
    id: "p4vest",
    station: "dk-p4vest"
  }, {
    id: "p4nord",
    station: "dk-p4nord"
  }, {
    id: "p4sjaelland",
    station: "dk-p4sjaelland"
  }, {
    id: "p4trekanten",
    station: "dk-p4trekanten"
  }, {
    id: "p4aarhus",
    station: "dk-p4aarhus"
  }, {
    id: "p5",
    station: "dk-p5"
  }, {
    id: "p6beat",
    station: "dk-p6beat"
  }, {
    id: "p7mix",
    station: "dk-p7mix"
  }, {
    id: "p8jazz",
    station: "dk-p8jazz"
  }
].each do |station|
    Class.new(Format::HTML) do
      config do
        id station.fetch(:station)
        url "http://www.dr.dk/radio/live/#{station.fetch(:id)}"
      end

      def process
        return unless track = data.at_css(".playlist-items li.track")
        {
          song: track.at_css(".track > a").text,
          artist: track.at_css(".name").text
        }
      end
    end
  end
end