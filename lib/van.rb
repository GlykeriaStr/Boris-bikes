require_relative 'bike_container'

class Van
  include BikeContainer

  def collect(bike)
    @bikes << bike
  end
end
