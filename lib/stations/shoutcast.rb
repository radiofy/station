module Station
  [{
    id: "radiohfs",
    url: "http://www.grythyttan.se:8000/"
  }, {
    id: "radioskelleftea",
    url: "http://ch1.goldtown.se/"
  }, {
    id: "radio943",
    url: "http://212.105.73.74:8007/"
  }, {
    id: "playdio",
    url: "http://141.255.187.217:80"
  }, {
    id: "countrykanalen",
    url: "http://37.187.90.121:3326",
  }, {
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
  }, {
    id: "gullkanalen",
    url: "http://67.212.189.122:8010/"
  }].each do |info|
    Class.new(Format::Shoutcast) do
      config do
        id info.fetch(:id)
        url info.fetch(:url)
      end
    end
  end
end