module Station
  class Reggae141 < Format::HTML
    config do
      id "reggae141"
      url "http://www.reggae141.com/requests/nowplaying.html"
    end

    def process
       {
         song: data.at_css("span:nth-child(1)").content,
         artist: data.at_css("span:nth-child(2)").content
       }
    end
  end
end