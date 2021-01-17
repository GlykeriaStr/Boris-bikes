require 'garage'
require 'van'
require 'bike'

describe Garage do

  subject(:garage) { described_class.new(bike)}
  let(:bike) { instance_double("Bike") }
  let(:van) { instance_double( "Van", release_broken_bike: bike, bikes: bike ) }

  it 'should fix a bike' do
    van.release_broken_bike(bike)
    expect(garage.fixed?(bike)).to be true
  end

  it 'should release a bike when it is working' do
    van.release_broken_bike(bike)
    garage.fixed?(bike)
    garage.release_bike(bike)
    expect(van.bikes).to eq bike
  end
end
