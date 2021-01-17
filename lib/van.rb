require_relative 'dockingstation'

class Van
  CAPACITY = 10
  attr_reader :capacity, :bikes

  def initialize
    @capacity = CAPACITY
    @bikes = []
  end

  def collect_broken(bike)
    @bikes << bike
  end

  def release_broken_bike(bike)
    garage = Garage.new(bike)
  end
end
