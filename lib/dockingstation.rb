
require_relative 'bike_container'

class DockingStation
  include BikeContainer

  def dock(bike)
   add_bike(bike)
  end
end
