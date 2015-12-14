module Station
  [{
    id: "musique",
    url: "http://ice.casterplay.net:8000/lounge.xspf"
  }, {
    id: "aura",
    url: "http://stream.anr.dk/aura.xspf",
  }].each do |info|
    Class.new(Format::XML) do
      config do
        id info.fetch(:id)
        url info.fetch(:url)
      end

      def process
        artist, song = split(super.at_css("track title").try(:text))
        { artist: artist, song: song }
      end
    end
  end
end