module Station
  class NorskCountry < Format::HTML
    config do
      id "norskcountry"
      url "http://www.norskcountry.net/includes/playlist.php?show=current"
    end

    def process
      track = data.
        at_css("body").
        text.
        gsub(/Spilles nå:/, "").
        gsub(/\[\d+:\d+\].+$/, "")
      artist, song = split(track)
      { artist: artist, song: song }
    end
  end
end