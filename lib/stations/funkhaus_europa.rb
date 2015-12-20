module Station
  class FunkhausEuropa < Format::HTML
    config do
      id "funkhaus-europa"
      url "http://www.funkhauseuropa.de/playlist/titelsuche104.html"
    end

    def process
      track = data.at_css("#searchPlaylistResult td:first")
      return unless track
      artist = track.at_css("strong").remove.text
      song = track.text.try(:strip)
      { song: song, artist: artist }
    end
  end
end
