require 'starline/entities/distance_filter'

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

      def filter_by_distance(search_params_hash)
        filter = DistanceFilter.new(search_params_hash)
        filter.apply_to(@tracks)
      end
    end
  end
end
