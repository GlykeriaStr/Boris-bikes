
require_relative 'bike'

class Dockingstation

  def initialize
    @bikes = []
  end

  def release_bike
   fail 'No bikes available' unless @bikes == []
   @bikes.pop
  end

  def dock(bike)
   fail "No more spaces" if @bikes.length >= 20
   @bikes << bike
  end

  attr_reader :bikes

end
