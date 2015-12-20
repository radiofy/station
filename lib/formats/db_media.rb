require_relative "./jsonp"

module Station
  module Format
    class DBMedia < JSONP
      def data
        track = super["airplays"].first
        track && { artist: track["Artist"], song: track["Title"] }
      end
    end
  end
end