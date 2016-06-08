require 'fast_haversine'
require 'starline/entities/track'
require 'starline/entities/tracks_collection'

module Starline
  module Builders
    class Tracks
      def self.build(geo_points)
        tracks = []

        geo_points.each_cons(2) do |start_point, end_point|
          tracks << build_track(start_point, end_point)
        end

        Entities::TracksCollection.new(tracks)
      end

      private
      def self.build_track(start_point, end_point)
        Entities::Track.new(
          start_point: start_point,
          end_point: end_point,
          distance: calculate_distance(start_point, end_point)
        )
      end

      def self.calculate_distance(start_point, end_point)
        FastHaversine.distance_between(
          [start_point.lat, start_point.lon],
          [end_point.lat, end_point.lon],
          :km
        )
      end
    end
  end
end
