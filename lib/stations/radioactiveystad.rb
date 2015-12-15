module Station
  class Radioactiveystad < Format::HTML
    config do
      id "radioactiveystad"
      url "http://radioactiveystad.se"
    end
    
    def process
      track = data.at_css("#current_song")
      artist, song = track && split(track.text)
      { artist: artist, song: song }
    end
  end
end