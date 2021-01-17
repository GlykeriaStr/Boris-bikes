require 'bike'

describe Bike do
  let(:bike) { described_class.new }
  let(:station) {instance_double('DockingStation')}

    it "should return true if bike is reported_broken" do
      bike.report_broken
      expect(bike.broken?).to eq true
    end

    it "should return false if bike hasn't been reported_broken" do
      expect(bike.broken?). to eq nil
    end
end
