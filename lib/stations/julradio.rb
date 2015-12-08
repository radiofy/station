require_relative "../classes/raw"

module Station
  class Julradio < Base::Raw
    def process
      artist, song = split(data)
      { artist: artist, song: song }
    end
  end
end