require 'van'

describe Van do
  subject(:van) { described_class.new }
  let(:bike) { instance_double('Bike') }
  let(:station) { instance_double('DockingStation', dock: bike, bikes: bike) }
  let(:garage) { instance_double('Garage', bikes: bike, fixed?: true, store_bike: bike) }

  it 'should have a default capacity' do
    expect(van.capacity).to eq Van::CAPACITY
  end

  it 'should start by being empty' do
    expect(van.bikes).to be_empty
  end

  it 'should collect broken bikes from docking stations' do
    allow(bike).to receive(:broken?).and_return(true)
    station.dock(bike)
    van.collect(bike)
    expect(van.bikes).to eq [bike]
  end

  it 'should deliver bikes to garages when they are broken' do
    allow(bike).to receive(:broken?).and_return(true)
    station.dock(bike)
    van.collect(bike)
    van.release_broken_bike(bike)
    garage.store_bike(bike)
    expect(garage.bikes).to eq bike
  end

  it 'should return working bikes to the docking station' do
    garage.store_bike(bike)
    garage.fixed?(bike)
    van.collect(bike)
    van.release_bike(bike)
    expect(station.bikes).to eq bike
  end
end
