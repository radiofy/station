module Station
  [{
    station: "radiosoft-dk",
    id: "21"
  }, {
    station: "the-voice-dk",
    id: "17"
  }, {
    station: "nova-dk",
    id: "18"
  }, {
    station: "radio-100-dk",
    id: "20"
  }, {
    station: "myRock-dk",
    id: "56"
  }, {
    station: "pop-fm-dk",
    id: "19"
  }, {
    station: "radio-klassisk-dk",
    id: "22"
  }, {
    station: "digster-top-30",
    id: "68"
  }].each do |station|
    Class.new(Format::JSONP) do
      config do
        id station.fetch(:station)
        url "http://static.radioplay.se/data/all_dk.jsonp"
        args [station.fetch(:id)]
      end

      def process(id)
        return unless raw = data[id]
        { 
          song: raw["title"].try(:gsub, /^Pi?\d+ - /i, ""), 
          artist: raw["artist"]
        }
      end
    end
  end
end
