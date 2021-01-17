require 'garage'
require 'van'
require 'bike'

describe Garage do

  subject(:garage) { described_class.new}
  let(:bike) { instance_double("Bike", fix: true) }
  let(:van) { instance_double( "Van", release_broken_bike: bike, bikes: bike) }

  it_behaves_like BikeContainer

  it 'should fix a bike' do
    garage.store_bike(bike)
    expect(garage.fix_bike(bike)).to be true
  end

end
