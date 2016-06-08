module Starline
  module Entities
    class TracksCollection
      include Enumerable

      def initialize(tracks)
        @tracks = tracks
      end

      def each(&block)
        @tracks.each(&block)
      end

      def size
        @tracks.size
      end

      def without_parking_tracks
        @tracks.reject { |track| track.distance == 0 }
      end
    end
  end
end
