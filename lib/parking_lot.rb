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
      puts "alloted spot nunber #{next_free_spot.id}"
      next_free_spot.park(reg_no, color)
    else
      puts "parking is full"
    end
  end

  def leave(spot_number)
    spot_number = spot_number.to_i
    if spot_number > 0 && spot_number <= spots.length
      spots[spot_number - 1].free
      puts "Spot number #{ spot_number.to_i - 1 } is freed "
    else
      puts "Envalid spot number"
    end
  end

  def registration_numbers_for_cars_with_colour(color)
   reg_no_spots =  spots.collect { |spot| spot.reg_no if spot.color == color}
   puts reg_no_spots.compact.join(',')
  end

  def ticket_numbers_for_cars_with_colour(color)
   ticket_numbers_of_spots =  spots.collect { |spot| spot.id if spot.color == color}
   puts ticket_numbers_of_spots.compact.join(',')
  end

  def ticket_number_for_registration_number(reg_no)
    ticket_numbers_of_spots =  spots.collect { |spot| spot.id if spot.reg_no == reg_no}
    puts ticket_numbers_of_spots.compact.join(',')
  end

  private

  def next_free_spot
    next_free_spot = spots.find {|spot| spot.free?}
  end
end
