require 'dockingstation'

describe DockingStation do
  let(:station) { described_class.new }

  it_behaves_like BikeContainer

end
