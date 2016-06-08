module Starline
  module Entities
    class Track
      attr_reader :start_point, :end_point, :distance

      def initialize(start_point:, end_point:, distance:)
        @start_point = start_point
        @end_point = end_point
        @distance = distance
      end
    end
  end
end
