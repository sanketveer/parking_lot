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

  def park(reg_no, color)
    if next_free_spot
      puts "alloted spot bunber #{next_free_spot.id}"
      next_free_spot.park(reg_no, color)
    else
      puts "parking is full"
    end
  end

  def leave
  end

  def free_spot
    free_spots = spots.each {|spot| spot.free?}
  end

  def next_free_spot
    next_free_spot = free_spots&.first
  end
end
