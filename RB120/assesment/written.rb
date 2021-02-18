class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name

# What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?

# The output of line 10 is `nil` because on line 2 the `attr_reader` method creates a getter method for the `@name` instance variable. On line 10 the `name` getter method returns the `@name` instance variable which has not been initialized and so returns `nil`. When local variables are not initialized they throw an error while instance variables will return `nil`.

module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim   

# What is output and why? What does this demonstrate about instance variables?


# `nil` is output from `line 16` executing because the `@can_swim` instance variable is not initialized. When the `Dog#swim` instance method is invoked on `line 16`, the `swim` method defined on `line 10-12` executes. Within the `swim` method, the String will be returned if the @can_swim instance variable is truthy. Since the `@can_swim` instance variable is not yet initialized and therefore set to `nil` (a falsy value), the `if` statement prevents the String from being returned, and the `swim` method returns `nil`.

# Instance variables that have not been initialized yet return `nil` (vs local variables which raise an exception when they have not been initialized). The `Swimmable` module is mixed into the `Dog` class successfully so `Dog` objects inherit the `enable_swimming` instance method, but this method must be invoked in order to initialize the `@can_swim` instance variable.


module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides 
p Square.new.sides 
p Square.new.describe_shape 

# What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above? 

# On line 26 `4` is output
# On line 27 `4` is output
# On line 28 an error is thrown because `SIDES` looks in the lexical scope where `SIDES` is referenced which is lines 2 to 6 for a value for the `SIDES` constant which is not defined. If we didn't want to raise an error we would have to use the namespace resolution operator to find the location of a defined `SIDES` constant, such as Quadrilateral::SIDES.

# In the `describe_shape` method `self` is refering to the instance that called the method.
# In the `self.sides` method `self` is refering to the class.
# In the `sides` method `self` is refering to the instance that called the method.

class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    animals + other_class.animals
  end

end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes
puts some_animal_classes.animals

# What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?

# The output of `line 38` is an array of `Animal` objects, the combined arrays of `@animals` from the  `birds` and `mammals` AnimalClass objects.

# The `AnimalClass#+` method is implemented on lines 13-15 and principally utilizes the `Array#+` method to concatenate the two `@animal` arrays together. This is not what we'd expect from this kind of `#+` method, since most built-in classes return a new object of the same type from the `#+` method. So in this case, we'd be in line with expectations if we return from `AnimalClass#+` a new `AnimalClass` object containing the @animals from both caller and argument.

# New implementation of `AnimalClass#+`:

def +(other_class)
    new_object = AnimalClass.new("New AnimalClass")
    new_object << animals << other_class.animals
    new_object.animals.flatten!
    new_object
end


class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info 
# => Spartacus weighs 10 lbs and is 12 inches tall.

# We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall.”` Why does our `change_info` method not work as expected?

=begin
  The `change_info` method doesn't work because the `name`, `height`, and `weight` variables are seen as local variables to ruby. If we wanted to update the instance variables with the same names we could either reference the instance variables directly using `@name = n @height = h @weight = w` or to use the setter method we would have to append self to the front of the variable like `self.name = n self.height = h self.weight = w`.

On lines 12-14, we intend to reassign the three instance variables using the setter methods. But instead, we are initializing three local variables.

```ruby
  name = n
  height = n
  weignt = h
```

If we append self to each of these lines, we'll actually invoke the instance variable setter method.

```ruby
  self.name = n
```
=end

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name 
bob.change_name
p bob.name

# In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`?

=begin
On `line 9` within the `change_name` method, the `name=` setter method is incorrectly invoked. Since there is no `self.` prefix, Ruby reads this line as local variable `name` being initialized to itself calling the `upcase` method. Since local variable `name` has no value yet and is set to `nil`, `upcase` is invoked on `nil` which is why we see the exception raised.

To adjust and output `'BOB'`, we need to call the setter `name=` on self.


class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels                             

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels                           
p Vehicle.wheels                              

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels                           
p Car.wheels




# What does the code above output, and why? What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?


=begin

On line 10 the output is `4`
On line 16 the output is `2`
On line 17 the output is `2`
On line 21-23 the output is `2`

This demonstrates that class variables can be reassigned by any subclass and the affects will be seen in every subclass. The way that class variables work with inheritance is not very intuative because unrelated subclasses aren't expected to affected each other. 
=end

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")       
p bruno

# What is output and why? What does this demonstrate about `super`?

=begin
Line 17 outputs a GoodDog object encoding which includes the object id and the state. In this case, both `@name` and `@color` instance variable reference the string `brown`. This is because `super`, invoked on line 11, is passed the `color` local variable as an argument. Since `color` references `'brown'`, when the initialize method from the `Animal` class is invoked by `super`, `@name` is set to `brown`.

When super is called without paretheses, all arguments passed into the containing method definition get passed to super in order. We could call super here and pas no arguments by including paretheses `super()`. We can also pass only certain of the arguments on to super by specifying them within the paretheses.

=end

class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")
p bear

# What is output and why? What does this demonstrate about `super`? 

=begin
On line 13 an `ArgumentError` is thrown because when a new instance of the `Bear` class is instantiated the argument `"black"` is passed to the `initialize` method on line 7. On line 8 super is invoked without () so all arguments are passed into super and up the Method Lookup Path to a method with a matching name to the method super was invoked in. In this case `Animal` also has an initialize method that doesn't take any arguments so when super passes the string `"black"` to the `initialize` method on line 2 an error is thrown.

To fix this you could change `super` on line 8 to `super()`.

=end

class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end

# What is output and why? How does this code demonstrate polymorphism? 
The output will be 
`"I eat"`
`"I eat plankton."`
`"I eat kibble."`
The code demonstrates polymorphism through Duck Typing because each instance has access to the `.eat` instance method which is defined separately in each class. All the instances have access to the `eat` method and since the Fish and Dog inherit from Animal they would have access to the `eat` method even if they did not define their own instance methods but in the above code since all the classes do define their own instance methods it is an example of Duck Typing.
    
Polymorphism:
  
  1. Class inheritance
  
  class Human
    def eat
    end
  end
  
  class Child < Human
  end
  
  2. Interface (module) inheritance
    
    module Eatable
      def eat
      end
    end
    
    class Human
      include Eatable
    end
    
    class Child
      include Eatable
    end
    
  3. Duck Typing (An idea, not a specific single-way of defining methods)
    as long as it has an _____ method and can respond to that method call, it's a _____ (duck)
    
    class Human
      def eat
        "I'm a human eating"
      end
    end
    
    class Dog
      def eat
        "I'm a dog eating, woof woof"
      end
    end

    def eat(species)
      puts species.eat
    end

    class Person
      attr_reader :name
    
      def initialize(name)
        @name = name
      end
    
      def to_s
        "My name is #{name.upcase!}."
      end
    end
    
    bob = Person.new('BOB')
    puts bob.name
    puts bob # <<<< 
    # p bob.to_s
    
    def puts(object) # << conceptually, this is what puts does, it's a Kernel method meaning it is really defined in C
      p object.to_s
    end
    # p '\n' << is this why it returns nil?
    puts bob.name
    
    # What is output on `lines 14, 15, and 16` and why?
    
    # semi trick question (Rona here)
    
    # what if @name is pointing to "BOB" (already upcased?)
    
    # I think it's a 101 thing; where upcase! returns nil if there's nothing to upcase?

    # Why is it generally safer to invoke a setter method (if available) vs. referencing the instance variable directly when trying to set an instance variable within the class? Give an example.


class Human
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def name=(name)
    @name = name.upcase
  end
  
  def change_name=(new_name)
    return "Oops! Not a correct name, must be string." if new_name is not string
    
    self.name = new_name
  end
  
  private
  
  attr_accessor :name
end


me = Human.new("Ben")

p me.name
me.name = "Bob"
p me.name
me.change_name = "Herbert"
p me.name

me.name.upcase!

# tangent: look into Object.class/instance_variable/method_get/set

# access, validation, future-proofing?/DRY?

class Shape
  @@sides = nil
  @@shapes = []
  @@shape_count = 0
  
  def self.sides
    @@sides
  end
  
  def self.shapes
    @@shapes
  end

  def sides
    @@sides
  end
  
  def self.add_shape(new_shape)
    @@shapes << new_shape
  end
end

class Triangle < Shape
  SIDES = 3
  
  def initialize
    self.class.add_shape(self)
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
    self.class.add_shape(self)
  end
end

Triangle.sides
Triangle.new.sides

p Quadrilateral.sides # => 3
p Quadrilateral.new.sides # => 4
p Triangle.sides # => 4
# What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` return? What does this demonstrate about class variables?
p Shape.shapes
# Is this good class design? Nope!