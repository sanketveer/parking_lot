require_relative './car'

class Spot
  attr_accessor :id, :car

  def initialize (id)
    @id = id.to_i
  end

  def park(reg_no, car_color)
    if self.car
      raise "Car Already Parked"
    else
      self.car = ::car.new(reg_no, car_color)
    end
  end

  def free
    self.car = nil
  end

  def free?
    self.car == nil
  end

  def reg_no
  end

  def car_color
  end
end