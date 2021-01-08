require 'dockingstation'

describe Dockingstation do
  it {is_expected.to respond_to(:release_bike)}

  describe '#release_bike' do

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    # it 'releases working bikes' do
    #   bike = subject.release_bike
    #   expect(bike).to be_working
    # end

    it 'raises an error when there are no bikes' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it 'docks a bike and stores' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'raises error when full capacity' do
    bike = Bike.new
    subject.dock(bike)
    expect { subject.dock(bike) }.to raise_error "No more spaces"
  end

  it {is_expected.to respond_to :bike}

  it 'show me what you got' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end
