
require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
   fail 'No bikes available' if empty?
   @bikes.pop
  end

  def dock(bike)
   fail "No more spaces" if full?
   @bikes << bike
  end

  private
  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes == []
  end
end
