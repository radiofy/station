module Station
  [{
    id: "radio943",
    url: "http://212.105.73.74:8007/"
  }, {
    id: "playdio",
    url: "http://141.255.187.217:80"
  }, {
    id: "countrykanalen",
    url: "http://37.187.90.121:3326",
  }, {
    id: "radiobastad",
    url: "http://212.31.164.21:8000/"
  }, {
    id: "kbk-radio",
    url: "http://media.kbkradio.se:80"
  }, {
    id: "kanal-rewind",
    url: "http://radio.euronet.nu:8000"
  }, {
    id: "radiohfs",
    url: "http://www.grythyttan.se:8000/index.html"
  }].each do |info|
    Class.new(Format::Shoutcast) do
      config do
        id info.fetch(:id)
        url info.fetch(:url)
      end
    end
  end
end