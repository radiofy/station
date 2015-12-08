require_relative "../classes/xml"

module Station
  class SlamFM < Base::XML
    def process
      song = data.at_css("Current titleName").try(:text)
      artist = data.at_css("Current artistName").try(:text)
      { song: song, artist: artist }
    end
  end
end