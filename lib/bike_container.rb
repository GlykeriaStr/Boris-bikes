module BikeContainer

  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail "There are no bikes." if empty?
    fail "Bikes are all broken" if @bikes.all?{ |bike| bike.broken? }
    bikes.delete(working_bike)
  end

  def add_bike(bike)
    fail "There is no more space." if full?
    bikes << bike
  end

  def release_broken_bike
    fail 'There are no bikes.' if empty?
    bikes.delete(broken_bike)
  end

  private


  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

  def no_working_bikes?
    bikes.all?{ |bike| bike.broken? }
  end

  def working_bike
    bikes.find{ |bike| bike.working? }
  end

  def broken_bike
    bikes.find{ |bike| !bike.working? }
  end
end
