require_relative 'bike'

class Garage

include BikeContainer
  

  def fix_bike(bike)
    bike.fix
  end

  def store_bike(bike)
    @bikes << bike
  end
end
