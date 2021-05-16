require_relative './car'

class Spot
  attr_accessor :id, :car

  def initialize (id)
    @id = id.to_i
  end

  def park
  end

  def reg_no
  end

  def car_color
  end
end