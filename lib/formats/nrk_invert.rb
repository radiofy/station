require_relative "./nrk"

module Station
  module Format
    class NRKInvert < NRK
      def data
        track = super
        { song: track.fetch(:artist), artist: track.fetch(:song) }
      end
    end
  end
end