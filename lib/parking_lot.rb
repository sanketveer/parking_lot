require_relative './spots'

class ParkingLot

  attr_accessor :spots

  def initialize(number_of_spots)
    @spots = []
    number_of_spots.to_i.times do |index|
      spot_number = index + 1
      spots[index] = Spot.new(spot_number)
    end
    puts "Created a parking lot with #{ number_of_spots } spots"
  end

  def park
  end

  def leave
  end

end
