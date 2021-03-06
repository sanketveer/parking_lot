require_relative './car'

class Spot
  attr_accessor :id, :car

  def initialize (id)
    @id = id.to_i
  end

  def park(reg_no, color)
    if self.car
      raise "Car Already Parked"
    else
      self.car = ::Car.new(reg_no, color)
    end
  end

  def free
    self.car = nil
  end

  def free?
    self.car == nil
  end

  def reg_no
    car.reg_no if car
  end

  def color
    car.color if car
  end
end