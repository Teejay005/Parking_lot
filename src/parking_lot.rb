require 'observer'

class Parking_lot
  include Observable

  attr_accessor :max_no_of_cars, :cars

  def initialize max_no_of_cars
    @max_no_of_cars = max_no_of_cars
    @cars = 0
  end

  def park
    @cars +=1
    changed
    notify_observers
  end

  def num_of_cars
    @cars
  end

  def full?
    @cars == @max_no_of_cars
  end

  def determine_percentage_full
    ((num_of_cars.to_f/@max_no_of_cars.to_f) * 100).round(0)
  end

end
