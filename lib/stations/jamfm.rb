module Station
  class Jamfm < Format::Raw
    config do
      id "jamfm"
      url "http://www.jamfm.se/current_song.php"
      exclude ["Guest DJ"]
    end

    def process
      artist, song = split(data)
      {song: song, artist: artist}
    end
  end
end