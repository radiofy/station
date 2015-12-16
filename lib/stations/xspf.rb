module Station
  [{
    id: "musique",
    url: "http://ice.casterplay.net:8000/lounge.xspf"
  }, {
    id: "aura",
    url: "http://stream.anr.dk/aura.xspf",
  }].each do |info|
    Class.new(Format::XSPF) do
      config do
        id info.fetch(:id)
        url info.fetch(:url)
      end
    end
  end
end