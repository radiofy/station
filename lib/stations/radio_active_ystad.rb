module Station
  class Cityradion < Format::HTML
    config do
      id "radio_active_ystad"
      url "http://radioactiveystad.se/"
    end

    def process
      track = data.at_css("#current_song").try(:text)
      artist, song = split(track)
      { artist: artist, song: song }
    end
  end
end
