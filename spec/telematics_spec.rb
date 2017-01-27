require 'spec_helper'

describe Starline::Telematics do
  let(:tracks_path) do
    File.expand_path('spec/assets/tracks.json')
  end

  let(:tracks_file) do
    File.read(tracks_path)
  end

  it 'does not allow to create an object without tracks data' do
    expect {
      described_class.new
    }.to raise_error(ArgumentError)
  end

  it 'initializes new object with tracks path as an option' do
    telematics = described_class.new(tracks_path)
    
    expect(telematics).to be_kind_of(described_class)
    expect(telematics.tracks_path).to eq(tracks_path)
  end

  it 'reads tracks data' do
    telematics = described_class.new(tracks_path)
    file_data = telematics.tracks_file.read

    expect(file_data).to be_kind_of(String)
    expect(file_data).not_to be_empty
  end

  it 'returns geo point objects' do
    telematics = described_class.new(tracks_path)

    geo_points = telematics.geo_points
    expect(geo_points.size).to eq(7)
    expect(geo_points).to all(be_kind_of(Starline::Entities::GeoPoint))
  end

  it 'returns track collection object' do
    telematics = described_class.new(tracks_path)

    tracks = telematics.tracks
    expect(tracks).to be_kind_of(Starline::Entities::TracksCollection)
  end
  
  it 'creates returned track collection object iterable' do
    telematics = described_class.new(tracks_path)

    tracks = telematics.tracks
    expect(tracks.size).to eq(6)
    expect(tracks).to all(be_kind_of(Starline::Entities::Track))
  end

  it 'filters tracks by the distance' do
    telematics = described_class.new(tracks_path)

    tracks = telematics.tracks
    filtered_tracks = tracks.filter_by_distance(ne: 0)
    expect(filtered_tracks.size).to eq(4)
    expect(filtered_tracks).to all(be_kind_of(Starline::Entities::Track))
  end
end
