require_relative "../classes/html"

module Station
  class FunkhausEuropa < Base::HTML
    def process
      track = data.at_css("#searchPlaylistResult td:first")
      if track
        artist = track.at_css("strong").remove.text
        song = track.text.try(:strip)
        {song: song, artist: artist}
      end
    end
  end
end