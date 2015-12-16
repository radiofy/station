module Station
  class Radio88 < Format::JSON
    config do
      id "radio88"
      url "http://www.radio88partille.se/player_session/ping"
    end

    def process
      artist, song = split(data["current_song"])
      { :song => (song), :artist => (artist) }

    end
  end
end
