require 'van'

describe Van do
  subject(:van) { described_class.new }
  let(:bike) { instance_double('Bike') }
  let(:station) { instance_double('DockingStation', dock: bike, bikes: bike) }
  let(:garage) { instance_double('Garage', bikes: bike, fix_bike: true, store_bike: bike) }


  it_behaves_like BikeContainer

  it 'should collect broken bikes from docking stations' do
    allow(bike).to receive(:broken?).and_return(true)
    station.dock(bike)
    van.collect(bike)
    expect(van.bikes).to eq [bike]
  end

  
end
