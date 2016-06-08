module Starline
  module Entities
    class GeoPoint
      attr_reader :lat, :lon, :timestamp

      def initialize(lat:, lon:, timestamp:)
        @lat = lat
        @lon = lon
        @timestamp = timestamp
      end
    end
  end
end
