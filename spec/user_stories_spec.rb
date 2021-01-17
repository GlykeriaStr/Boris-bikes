require 'bike'
require 'dockingstation'
require 'van'
require 'garage'


describe 'User Stories' do
  let(:station) { DockingStation.new }
  let(:bike) { Bike.new }
  let(:van) { Van.new }
  let(:garage) { Garage.new }


  # As a person,
  # So that I can use a bike,
  # I'd like a docking station to release a bike.
  it 'releases a bike' do
    allow(bike).to receive(:broken?).and_return(false)
    station.dock(bike)
    expect(station.release_bike).to eq bike
  end

  # As a person,
  # So that I can use a good bike,
  # I'd like to see if a bike is working
  it 'releases working bikes' do
    allow(bike).to receive(:broken?).and_return(false)
    station.dock(bike)
    expect(station.release_bike).to be_working
  end

  # As a member of the public
  # So I can return bikes I've hired
  # I want to dock my bike at the docking station
  it 'docks a bike and stores' do
    expect(station.dock(bike)).to eq [bike]
  end

  # As a member of the public
  # So I can decide whether to use the docking station
  # I want to see a bike that has been docked
  it 'shows you all the bikes' do
    station.dock(bike)
    expect(station.bikes).to eq [bike]
  end

  # As a maintainer of the system,
  # So that I can control the distribution of bikes,
  # I'd like docking stations not to accept more bikes than their capacity.
  it 'raises error when full capacity' do
    station.capacity.times { station.dock(bike)}
    expect { station.dock(bike)}.to raise_error "There is no more space."
  end

  # As a system maintainer,
  # So that I can plan the distribution of bikes,
  # I want a docking station to have a default capacity of 20 bikes.
  it 'has a default capacity when no argument is passed' do
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  # As a system maintainer,
  # So that busy areas can be served more effectively,
  # I want to be able to specify a larger capacity when necessary.
  it 'changes the capacity of the station' do
    station = DockingStation.new(30)
    expect(station.capacity).to eq 30
  end

  # As a member of the public,
  # So that I reduce the chance of getting a broken bike in future,
  # I'd like to report a bike as broken when I return it.
  it "should return true if bike is reported_broken" do
    bike.report_broken
    expect(bike.broken?).to eq true
  end

  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like docking stations not to release broken bikes.
  it "doesn't release bikes when they are broken" do
    bike.report_broken
    allow(bike).to receive(:broken?).and_return(true)
    station.dock(bike)
    expect { station.release_bike }.to raise_error 'Bikes are all broken'
  end

  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like docking stations to accept returning bikes (broken or not).
  it 'docks a bike even if broken' do
    bike.report_broken
    expect(station.dock(bike)).to eq [bike]
  end

  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.
  it 'should collect broken bikes from docking stations and delivers them to garages' do
    bike.report_broken
    station.dock(bike)
    station.release_broken_bike
    van.collect(bike)
    van.release_broken_bike
    garage.store_bike(bike)
    expect(garage.bikes).to eq [bike]
  end

  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like vans to collect working bikes from garages and distribute them to docking stations.
  it 'should return working bikes to the docking station' do
    garage.store_bike(bike)
    garage.fix_bike(bike)
    van.collect(bike)
    van.release_bike
    station.dock(bike)
    expect(station.bikes).to eq [bike]
  end
end
