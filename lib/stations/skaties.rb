module Station
  class Skaty < Format::HTML
    config do
      id "skaties"
      url "http://starfm.skaties.lv/dziesmu-top/"
    end

    def process
      track = data.at_css("#song-top-10 :nth-child(1) td:nth-child(2)").try(:text)
      artist, song = track && split(track)
      { artist: artist, song: song }
    end
  end
end
