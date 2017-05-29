def dk(station)
  [station, "http://www.radioplay.dk/#{station}", "dk", station]
end

def se(station)
  ["latlista", "http://www.radioplay.se/#{station}", "se", station]
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
    station: "the-voic-dk",
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
        args [playlist, name, country]
      end

      def process(playlist, id, country)
        if country == "dk"
          return nil
        end

        unless track = select(get(extract_hash(data, playlist), to_selector(id, playlist)))
          return nil
        end

        {
          song: track.fetch("title"),
          artist: track.fetch("artist")
        }
      end

      def extract_hash(data, playlist)
        script = data.css("script").find do |script|
          script.to_s.match(/#{playlist}/)
        end.text or raise "no script found"

        JSON.parse(script.match(/({.+})/).to_a[1])
      end

      def select(configs)
        mod = get(configs, "[-1].modules").detect do |mod|
          mod && mod["type"] == "track_history"
        end

        unless mod
          return nil
        end

        get(mod, ".content[0]")
      end

      def to_selector(id, playlist)
        ".context.dispatcher.stores.PageStore.pages./#{id}.data"
      end
    end
  end
end