module Station
  class SoundicRadio < Format::JSON
    config do
      url "http://api.soundicradio.com/"
      id "soundic-radio"
    end

    def process
      { artist: data["current_artist"], song: data["current_song"] }
    end
  end
end