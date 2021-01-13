# Print to the screen your method lookup for the classes that you have created.

module Truckable
  def has_truck_bed
    p "I have a truck bed"
  end
end

class Vehicle
  @@number_of_vehicles = 0
  attr_accessor :color
  attr_reader :year
  
  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end
  
  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
  
  def self.total_vehicles
    @@number_of_vehicles
  end
end

class MyCar < Vehicle
  SIZE = "<20000"
  
end

class MyTruck < Vehicle
  include Truckable
  SIZE = ">20000"
end

# MyCar.gas_mileage(13, 351)  # => "27 miles per gallon of gas"

car = MyCar.new(1994, "Chevy", "Red")
truck = MyTruck.new(2001, "Tacoma", "Gray")
truck.has_truck_bed

puts MyTruck.ancestors
p MyCar.ancestors
p Vehicle.ancestors