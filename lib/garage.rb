require_relative 'bike'

class Garage
  attr_reader :bikes

  def initialize
    @bikes = []
    @fixed = false
  end

  def fixed?(bike)
    @fixed = true
  end

  def release_bike(bike)
    van = Van.new
    van.collect(bike)
  end

  def store_bike(bike)
    @bikes << bike
  end
end
