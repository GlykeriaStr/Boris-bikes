require 'van'

describe Van do
  subject(:van) { described_class.new }
  let(:bike) { double :bike }
  let(:station) { double :docking_station, dock: bike}
  let(:garage) { double :garage, bikes: bike}

  it 'should have a default capacity' do
    expect(van.capacity).to eq Van::CAPACITY
  end

  it 'should start being empty' do
    expect(van.bikes).to be_empty
  end

  it 'should collect bikes from docking stations if they are broken' do
    allow(bike).to receive(:broken?).and_return(true)
    station.dock(bike)
    van.collect_broken(bike)
    expect(van.bikes).to eq [bike]
  end

  it 'should deliver bikes to garages when they are broken' do
    allow(bike).to receive(:broken?).and_return(true)
    station.dock(bike)
    van.collect_broken(bike)
    van.release_broken_bike(bike)
    expect(garage.bikes).to eq bike
  end
end
