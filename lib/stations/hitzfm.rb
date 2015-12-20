module Station
  class Hitzfm < Format::XML
    config do
      id "hitzfm"
      url "http://www.hitzfm.nu/Program/digrad/OnAir.XML"
    end

    def process
      track = data.search("//Song[//Position[contains(text(),0)]]").first
      artist = track && track.at_css("Artist").try(:text)
      song = track && track.at_css("Title").try(:text)
      { song: song, artist: artist }
    end
  end
end
