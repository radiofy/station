require_relative "../classes/html"

module Station
  class Neradio < Base::HTML
    def process
      raw = super.css("tr").to_a[15].try(:at_css, "b").try(:text)
      artist, song = split(raw)
      {artist: artist, song: song}
    end
  end
end