module Station
  class Starfm < Format::JSONP
    config do
      id "starfm"
      url "http://rds.starfm.ee/jsonRdsInfo.php?Name=Star&jsoncallback=cb"
    end
    
    def process
      { artist: data["currentArtist"], song: data["currentSong"] }
    end
  end
end