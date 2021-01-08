
require_relative 'bike'

class Dockingstation

   def release_bike
     fail 'No bikes available' unless @bike
     @bike
   end

   def dock(bike)
     fail "No more spaces" if @bike
     @bike = bike
   end

   attr_reader :bike

end
