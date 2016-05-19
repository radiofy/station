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
  }].each do |station|
    Class.new(Format::JSON) do
      config do
        id station.fetch(:station)
        source ({
          url: "http://www.radioplay.se/api/core/page?url=/#{station.fetch(:id)}/latlista",
          cookies: { country: "se" }
        })
        exclude ["Mer musik kommer snart", "Mastermix"]
      end

      def process
        return unless page = data.fetch("pages").last
        return unless tracks = find(page.fetch("modules"))
        return unless track = tracks.fetch("content").first
        {
          song: track.fetch("title"),
          artist: track.fetch("artist")
        }
      end

      def find(modules)
        modules.find do |mod|
          next false unless mod["content"].is_a?(Array)
          next false unless mod["content"].first.is_a?(Hash)
          next false unless track = mod["content"].first
          not track["title"].blank? and not track["artist"].blank?
        end
      end
    end
  end
end