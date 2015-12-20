module Station
  [{
    id: "neradio-sweden",
    url: "http://213.163.66.141"
  }, {
    id: "neradio-nonstop",
    url: "http://ms.neradio.com:5500"
  }, {
    id: "neradio-hardstyle",
    url: "http://load.hardstyle.nu:443"
  }, {
    id: "neradio-house-trance",
    url: "http://fire1.neradio.com/index.html"
  }].each do |station|
    Class.new(Format::Shoutcast) do
      config do
        id station.fetch(:id)
        url station.fetch(:url)
      end
    end
  end
end