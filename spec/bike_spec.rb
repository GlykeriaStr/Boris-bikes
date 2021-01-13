require 'bike'

describe Bike do
  # let(:bike) { double :bike }
    it { is_expected.to respond_to :working? }

    it { is_expected.to respond_to :report_broken }

    it { is_expected.to respond_to :broken? }

    it "should return true if bike is reported_broken" do
      # allow(bike).to receive(:broken?).and_return true
      bike = Bike.new
      station = DockingStation.new
      bike.report_broken
      expect(bike.broken?).to eq true
    end

    it "should return false if bike hasn't been reported_broken" do
      bike = Bike.new
      station = DockingStation.new
      expect(bike.broken?). to eq nil
    end
end
