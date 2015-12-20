require_relative "./jsonp"

module Station
  module Format
    class MTG < JSONP
      def data
        { song: super["title"], artist: super["artist"] }
      end
    end
  end
end