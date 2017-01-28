module Starline
  module Entities
    class DistanceFilter
      # Supported filter names
      FILTERS = %i(eq ne gt lt gte lte)

      # Mapping between filter names and its ruby functions
      OPERATORS = {
        :eq  => :==,
        :ne  => :!=,
        :gt  => :>,
        :lt  => :<,
        :gte => :>=,
        :lte => :<=
      }

      attr_reader :type, :value

      # Initialize +DistanceFilter+ object from Hash.
      #
      # Usage
      #
      #   DistanceFilter.new(gt: 5.4)
      #
      # Supports only one filter as search parameterfor now.
      def initialize(search_params_hash)
        raise_invalid_argument_type_error unless search_params_hash.is_a?(Hash)
        raise_unknown_filter_error if search_params_hash.empty?
        raise_ambiguous_filter_error if search_params_hash.size > 1

        @type  = search_params_hash.keys.first
        @value = search_params_hash.values.first

        raise_unknown_filter_error unless supported_filter?
        raise_invalid_value_error unless valid_value?
      end

      # Applies filter to a given collection.
      #
      # Usage
      #
      #   filter.apply_to(tracks)
      #
      # Returns a collection with items which satisfy the current filter
      def apply_to(collection)
        collection.select { |item| item.distance.send(operator, @value) }
      end

      private
      def supported_filter?
        FILTERS.include?(type)
      end

      def valid_value?
        value.is_a?(Numeric)
      end

      def operator
        OPERATORS[type]
      end

      def raise_invalid_argument_type_error
        raise ArgumentError,
          "Invalid argument type. Search filter must be a Hash"
      end

      def raise_unknown_filter_error
        raise ArgumentError, "Filter type is unknown"
      end

      def raise_ambiguous_filter_error
        raise ArgumentError, "Multiple search parameters are not supported"
      end

      def raise_invalid_value_error
        raise ArgumentError, "Filter value must be numeric typed"
      end
    end
  end
end
