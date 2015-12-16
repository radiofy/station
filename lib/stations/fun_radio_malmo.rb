module Station
  class FunRadioMalmo < Format::Raw
    config do
      id "fun-radio-malmo"
      url "http://funradio.se/program/lastplay.js"
    end

    def process
      track = data.match(/song\[1\]="([^"]+)"/).to_a.last
      artist, song = (track and split(track))
      { :artist => (artist), :song => (song) }

    end
  end
end
