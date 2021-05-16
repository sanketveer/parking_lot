require_relative './spots'

class ParkingLot

  attr_accessor :spots

  def initialize(number_of_spots)
    @spots = []
    number_of_spots.times do |index|
      spot_number = index + 1
      spots[index] = Spot.new(spot_number)
    end
    puts "Create a parking lot with #{ number_of_spots } spots"
  end

  def park
    #to park the car
  end

  def leave
     #to free the parking slot
  end

end
