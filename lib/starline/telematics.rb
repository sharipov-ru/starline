require 'starline/builders'
require 'json'

module Starline
  class Telematics
    attr_reader :tracks_path

    def initialize(tracks_path)
      @tracks_path = File.expand_path(tracks_path)
    end
    
    def tracks_file
      File.open(tracks_path)
    end

    def geo_points
      Starline::Builders::GeoPoints.build(parsed_tracks_file)
    end

    def tracks
      Starline::Builders::Tracks.build(geo_points)
    end

    private

    def parsed_tracks_file
      JSON.parse(File.read(tracks_file))
    end
  end
end
