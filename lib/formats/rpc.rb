require_relative "./jsonp"

module Station
  module Format
    class RPC < JSONP
      def data
        track = super["data"].first["track"]
        return unless track
        { song: track["title"], artist: track["artist"] }
      end
    end
  end
end