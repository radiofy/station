require "cgi"

module Station
  class K103 < Format::JSON
    config do
      id "k103"
      url "http://www.k103.se/blockupdate/update/webbradio"
      disabled true
    end

    def process
      raw = data.fetch("webbradio").gsub("x3e", ">").gsub("x3c", "<")
      result = Nokogiri::HTML(raw).at_css(".programlink").attr("title")
      artist, song = split(result)
      { song: song, artist: artist }
    end
  end
end
