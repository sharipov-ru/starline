require 'spec_helper'

describe Starline::Entities::DistanceFilter do
  let(:filter) { described_class.new(eq: 5.6) }

  it "responds to type returning the type of filter" do
    expect(filter.type).to eq(:eq)
  end

  it "responds to value returning the value passed to filter" do
    expect(filter.value).to eq(5.6)
  end

  it "raises an error when there are multiple filters in search query" do
    expect {
      described_class.new(lt: 120, gte: 2.2)
    }.to raise_error(
      ArgumentError,
      "Multiple search parameters are not supported"
    )
  end

  it "raises an error when filter type is empty" do
    expect {
      described_class.new({})
    }.to raise_error(ArgumentError, "Filter type is unknown")
  end

  it "raises an error when filter type is unknown" do
    expect {
      described_class.new(unknown: 550)
    }.to raise_error(ArgumentError, "Filter type is unknown")
  end

  it "raises an error when filter value is nil" do
    expect {
      described_class.new(gt: nil)
    }.to raise_error(ArgumentError, "Filter value must be numeric typed")
  end

  it "raises an error when filter value is String" do
    expect {
      described_class.new(gt: "2.2")
    }.to raise_error(ArgumentError, "Filter value must be numeric typed")
  end

  it "do not raises an error when filter value is numeric" do
    expect {
      described_class.new(gt: 2.2)
      described_class.new(gt: 20)
      described_class.new(gt: 2000000000000000000000000)
    }.not_to raise_error
  end

  describe "#apply_to" do
    let(:collection) do
      [
        double(id: 1, distance: 50),
        double(id: 2, distance: 60),
        double(id: 3, distance: 70),
        double(id: 4, distance: 80),
        double(id: 5, distance: 90),
        double(id: 6, distance: 100),
        double(id: 7, distance: 110),
        double(id: 8, distance: 120),
      ]
    end

    it "supports eq filter" do
      filter = described_class.new(eq: 100)
      results = filter.apply_to(collection)

      expect(results.map(&:id)).to eq([6])
    end

    it "supports ne filter" do
      filter = described_class.new(ne: 100)
      results = filter.apply_to(collection)

      expect(results.map(&:id)).to eq([1, 2, 3, 4, 5, 7, 8])
    end

    it "supports gt filter" do
      filter = described_class.new(gt: 100)
      results = filter.apply_to(collection)

      expect(results.map(&:id)).to eq([7,8])
    end

    it "supports lt filter" do
      filter = described_class.new(lt: 100)
      results = filter.apply_to(collection)

      expect(results.map(&:id)).to eq([1, 2, 3, 4, 5])
    end

    it "supports gte filter" do
      filter = described_class.new(gte: 100)
      results = filter.apply_to(collection)

      expect(results.map(&:id)).to eq([6, 7,8])
    end

    it "supports lte filter" do
      filter = described_class.new(lte: 100)
      results = filter.apply_to(collection)

      expect(results.map(&:id)).to eq([1, 2, 3, 4, 5, 6])
    end
  end
end
