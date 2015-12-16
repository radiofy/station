module Station
  class RadioDcm < Format::HTML
    config do
      id "radio-dcm"
      url "http://www.radiodcm.se/onair.asp?x=1"
    end

    def process
      track = data.at_css("body").try(:content)
      track = track && track.match(/ONAIR: (.+?)BEFORE:/).to_a.last
      artist, song = track && split(track)
      { song: song, artist: artist }
    end
  end
end
