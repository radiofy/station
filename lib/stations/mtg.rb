module Station
  [{
    station: "mix-megapol",
    id: "1"
  }, {
    station: "mix-megapol-goteborg",
    id: "2"
  }, {
    station: "mix-megapol-malmo",
    id: "3"
  }, {
    station: "rockklassiker",
    id: "4"
  }, {
    station: "the-voice",
    id: "5"
  }, {
    station: "vinyl-107",
    id: "6"
  }, {
    station: "party-people",
    id: "23"
  }, {
    station: "run-nation",
    id: "26"
  }, {
    station: "we-love-80s",
    id: "29"
  }, {
    station: "2012-hits",
    id: "42"
  }, {
    station: "nrj",
    id: "49"
  }].each do |station|
    Class.new(Format::JSONP) do
      config do
        id station.fetch(:station)
        url "http://static.radioplay.se/data/all_se.jsonp"
        exclude ["Mer musik kommer snart", "Mastermix"]
        args [station.fetch(:id)]
      end

      def process(id)
        return unless raw = data.fetch(id, false)
        {
          song: raw["title"].try(:gsub, /^Pi?\d+ - /i, ""),
          artist: raw["artist"]
        }
      end
    end
  end
end