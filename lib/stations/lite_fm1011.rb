module Station
  class LiteFm1011 < Format::HTML
    config do
      id "lite-fm-101-1"
      url "http://www.litefm.se/include/right/justnu_standalone.php"
    end

    def process
      artist, song = split(data.at_css("p:first").text)
      {artist: artist, song: song}
    end
  end
end