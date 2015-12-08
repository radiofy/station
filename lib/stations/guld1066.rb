require_relative "../classes/raw"

module Station
  class Guld1066 < Base::Raw
    def process
      raw = data.scan(/var\s*(.+?)\s*=\s*'(.+?)'/)
      {
        artist: raw.detect{|s| s.first == "artist"}.try(:last),
        song: raw.detect{|s| s.first == "song"}.try(:last)
      }
    end
  end
end