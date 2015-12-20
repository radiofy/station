module Station
  class Skyradio < Format::XML
    config do
      id "skyradio"
      url "http://www.skyradio.nl/cdn/player_skyradio.xml"
    end

    def process
      song = data.at_css("[name=cue_title]").try(:text)
      artist = data.at_css("[name=track_artist_name]").try(:text)
      { song: song, artist: artist }
    end
  end
end