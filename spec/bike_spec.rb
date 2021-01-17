require 'bike'

describe Bike do
  let(:bike) { described_class.new }
  let(:station) {instance_double('DockingStation')}

    it 'should starts by working' do
      expect(bike.working?).to eq true
    end

    it 'should return true if bike is reported_broken' do
      bike.report_broken
      expect(bike.broken?).to eq true
    end

    it 'should return false if bike hasnt been reported_broken' do
      expect(bike.broken?). to eq nil
    end

    it 'should fix bike from broken to working' do
      expect(bike.fix).to be true
    end
end
