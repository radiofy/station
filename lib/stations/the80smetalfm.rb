module Station
  class The80smetalfm < Format::JSON
    config do
      id "80s-metal-fm"
      url "http://player.bigrradio.com/streamdata.php?h=107.155.111.234&p=8310&i=&f=&c=67430"
    end

    def process
      artist, song = split(data["song"])
      { artist: artist, song: song }
    end
  end
end