module Station
  class Dixieradio < Format::HTML
    config do
      id "dixieradio"
      url "http://www.dixieradio.se/nowonair.php"
    end

    def process
      _, track = data.at_css(".sansserif").text.match(/Spelas just nu:(.+?)$/).to_a
      artist, song = (track and split(track))
      { :artist => (artist), :song => (song) }

    end
  end
end
