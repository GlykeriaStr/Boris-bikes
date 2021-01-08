
require_relative 'bike'

class Dockingstation

DEFAULT_CAPACITY = 20

  def initialize
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

  attr_reader :bikes

  private
  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes == []
  end
end
