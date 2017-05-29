module Station
  class Aura < Format::JSON
    config do
      id "aura"
      url "http://www.radioaura.dk/playlist"
    end

    def process
      return nil
      # tracks = data["PlayHistory"]["PlayInfo"]
      # return if tracks.blank?
      # {
      #   song: tracks.first["TITLE"],
      #   artist: tracks.first["ARTI"]
      # }
    end
  end
end
