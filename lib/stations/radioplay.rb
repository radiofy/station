def dk(station)
  ["playlister", "http://www.radioplay.dk/#{station}/playlister", "dk", station]
end

def se(station)
  ["latlista", "http://www.radioplay.se/#{station}/latlista", "se", station]
end

module Station
  [{
    station: "mix-megapol",
    config: se("mixmegapol")
  }, {
    station: "mix-megapol-goteborg",
    config: se("mixmegapolgoteborg")
  }, {
    station: "rockklassiker",
    config: se("rockklassiker")
  }, {
    station: "the-voice",
    config: se("thevoice")
  }, {
    station: "vinylfm",
    config: se("vinylfm")
  }, {
    station: "the-voice-party-people",
    config: se("the-voice-party-people")
  }, {
    station: "nrj",
    config: se("nrj")
  }, {
    station: "svensk-pop",
    config: se("svensk-pop")
  }, {
    station: "radiosoft-dk",
    config: dk("radiosoft")
  }, {
    station: "the-voice-dk",
    config: dk("thevoice")
  }, {
    station: "nova-dk",
    config: dk("nova")
  }, {
    station: "radio-100-dk",
    config: dk("radio100")
  }, {
    station: "myRock-dk",
    config: dk("myrock")
  }, {
    station: "pop-fm-dk",
    config: dk("popfm")
  }, {
    station: "radio-klassisk-dk",
    config: dk("radioklassisk")
  }, {
    station: "digster-top-30",
    config: dk("digster")
  }
].each do |station|
    Class.new(Format::HTML) do
      playlist, url, country, name = station.fetch(:config)
      config do
        id station.fetch(:station)
        disabled station.fetch(:disabled, false)
        source ({
          url: url,
          cookies: { country: country },
        })
        exclude ["Mer musik kommer snart", "Mastermix"]
        args [playlist, name]
      end

      def process(playlist, id)
        track = select(get(extract_hash(data, playlist), to_selector(id, playlist)))
        { song: track.fetch("title"), artist: track.fetch("artist") }
      end

      def extract_hash(data, playlist)
        script = data.css("script").find do |script|
          script.to_s.match(/#{playlist}/)
        end.text or raise "no script found"

        JSON.parse(script.match(/({.+})/).to_a[1])
      end

      def select(modules)
        result = modules.find do |mod|
          not mod.fetch("content", []).empty?
        end

        result && get(result, ".content[0]", false)
      end

      def to_selector(id, playlist)
        ".context.dispatcher.stores.PageStore.pages./#{id}/#{playlist}.data[-1].modules"
      end
    end
  end
end