module Station
  [{
    id: "netrock101",
    url: "http://netrock101.servebeer.com:9000"
  }, {
    id: "radiobastad",
    url: "http://212.31.164.21:8000/"
  }, {
    id: "gold24-fm",
    url: "http://gold24.fm:8084/"
  }, {
    id: "kbk-radio",
    url: "http://media.kbkradio.se:80"
  }, {
    id: "kanal-rewind",
    url: "http://radio.euronet.nu:8000"
  }].each do |info|
    Class.new(Format::Shoutcast) do
      config do
        id info.fetch(:id)
        url info.fetch(:url)
      end
    end
  end
end