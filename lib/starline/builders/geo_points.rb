require 'starline/entities/geo_point'

module Starline
  module Builders
    class GeoPoints
      def self.build(tracks_json)
        points = tracks_json.fetch("desc")
        points.map { |point_hash| build_geo_point(point_hash) }
      end

      private
      def self.build_geo_point(hash)
        Entities::GeoPoint.new(
          lat: hash["y"],
          lon: hash["x"],
          timestamp: hash["ts"]
        )
      end
    end
  end
end

