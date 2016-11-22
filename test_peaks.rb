require 'minitest/autorun'
require_relative 'peaks'

describe Peaks do
  let(:data_array) { [1,4,3] }
  let(:peak_indicies) { [1] }
  let(:peaks) { Peaks.new data_array }

  describe "#new" do
    it "creates an object that delegates to Array" do
      peaks.must_be_kind_of Array
    end

    it "self returns the array" do
      peaks.must_equal data_array
    end

    describe "given a numeric array" do
      it "only assigns peaks to peak_indicies" do
        peaks.peak_indicies.must_equal peak_indicies
      end

      it "peak_indices is empty if no peaks are found" do
        peaks = Peaks.new [5,1,6]
        peaks.peak_indicies.must_equal []
      end

      it "peak_indices is empty if array.length is <= 2" do
        peaks = Peaks.new [5,1]
        peaks.peak_indicies.must_equal []
      end
    end

    describe "given a string array" do
      let(:data_array) { %w(b z c) }
      let(:peak_indicies) { [1] }
      let(:peaks) { Peaks.new data_array }

      it "only assigns peaks to peak_indicies" do
        peaks.peak_indicies.must_equal peak_indicies
      end

      it "peak_indices is empty if no peaks are found" do
        peaks = Peaks.new %w(z a x)
        peaks.peak_indicies.must_equal []
      end

      it "peak_indices is empty if array.length is <= 2" do
        peaks = Peaks.new %w(a b)
        peaks.peak_indicies.must_equal []
      end
    end

    describe "given a multi-type array" do
      let(:data_array) { [2,4,'a'] }
      let(:peak_indicies) { [1] }
      let(:peaks) { Peaks.new data_array }

      it "raises an error" do
        proc { peaks }.must_raise ArgumentError
      end
    end
  end
end

