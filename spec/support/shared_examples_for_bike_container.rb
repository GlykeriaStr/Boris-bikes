shared_examples_for BikeContainer do
  subject(:bike_container) { described_class.new }
  let(:broken_bike) { double :bike, broken?: true, working?: false}
  let(:bike) { double :bike, broken?: false, working?: true }

  it 'has a default capacity when initialized' do
    expect(bike_container.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end

  it 'should initialize empty' do
    expect(bike_container.bikes).to be_empty
  end

  describe '#add_bike' do
    it 'adds bikes to the container' do
      bike_container.add_bike(bike)
      expect(bike_container.bikes).to include(bike)
    end

    it 'does not add a bike when is in full capacity' do
      bike_container.capacity.times { bike_container.add_bike(bike) }
      expect{ bike_container.add_bike(bike) }.to raise_error "There is no more space."
    end
  end

  describe '#release_bike' do
    it 'should release a bike' do
      bike_container.add_bike(bike)
      bike_container.release_bike
      expect(bike_container.bikes).not_to include(bike)
    end

    it 'should raise an error if there are no bikes' do
      expect{ bike_container.release_bike }.to raise_error "There are no bikes."
    end

  end

  describe '#release_broken_bike' do
    it 'should release_broken_bikes' do
      bike_container.add_bike(broken_bike)
      bike_container.release_broken_bike
      expect(bike_container.bikes).not_to include(broken_bike)
    end

    it 'should raise an error if there are no bikes' do
      expect { bike_container.release_broken_bike }.to raise_error "There are no bikes."
    end
  end
end
