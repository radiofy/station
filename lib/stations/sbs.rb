module Station
  [{
    station: "mix-megapol",
    id: "mixmegapol"
  }, {
    station: "mix-megapol-goteborg",
    id: "mixmegapolgoteborg"
  }, {
    station: "rockklassiker",
    id: "rockklassiker"
  }, {
    station: "the-voice",
    id: "thevoice"
  }, {
    station: "vinylfm",
    id: "vinylfm"
  }, {
    station: "the-voice-party-people",
    id: "the-voice-party-people"
  }, {
    station: "nrj",
    id: "nrj"
  }, {
    station: "svensk-pop",
    id: "svensk-pop"
  }].each do |station|
    Class.new(Format::HTML) do
      config do
        id station.fetch(:station)
        source ({
          url: "http://www.radioplay.se/#{station.fetch(:id)}/latlista",
          cookies: { country: "se" },
        })
        exclude ["Mer musik kommer snart", "Mastermix"]
        args [station.fetch(:id)]
      end

      def process(id)
        track = get(extract_hash(data), to_selector(id))
        { song: track.fetch("title"), artist: track.fetch("artist") }
      end

      def extract_hash(data)
        script = data.css("script").find do |script|
          script.to_s.match(/latlista/)
        end.text or raise "no script found"

        JSON.parse(script.match(/({.+})/).to_a[1])
      end

      def to_selector(id)
        ".context.dispatcher.stores.PageStore.pages./#{id}/latlista.data[-1].modules[-1].content[0]"
      end
    end
  end
end