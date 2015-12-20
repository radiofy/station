module Station
  class SlamFm < Format::XML
    config do
      id "slam-fm"
      url "http://www.slamfm.nl/media/onair.xml"
    end

    def process
      song = data.at_css("Current titleName").try(:text)
      artist = data.at_css("Current artistName").try(:text)
      { song: song, artist: artist }
    end
  end
end
