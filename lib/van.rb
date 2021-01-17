require_relative 'dockingstation'

class Van
  CAPACITY = 10
  attr_reader :capacity, :bikes

  def initialize
    @capacity = CAPACITY
    @bikes = []
  end

  def collect(bike)
    @bikes << bike
  end

  def release_broken_bike(bike)
    garage = Garage.new
    garage.store_bike(bike)
  end

  def release_bike(bike)
    station = DockingStation.new
    station.dock(bike)
  end
end
