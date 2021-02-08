# In the last question we had a module called Speed which contained a go_fast method.
# We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end
# When we called the go_fast method from an instance of the Car class (as shown below) 
# you might have noticed that the string printed when we go fast includes the name of 
# the type of vehicle we are using. How is this done?

small_car = Car.new
small_car.go_fast
# I am a Car and going super fast!
#Answer: self is refering the the instance of car (small_car) and calling class on it to find the name of the class that small_car
# is prototyped from. Then the #{} string interpolation calls the to_s method on that return value which is Car to add it to the 
# rest of the string.