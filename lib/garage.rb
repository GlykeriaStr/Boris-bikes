require_relative 'bike'

class Garage

  def initialize(bike)
    @bike = bike
    @fixed = false
  end

  def fixed?(bike)
    @fixed = true
  end

  def release_bike(bike)
    Van.new.bikes << bike
  end
end
