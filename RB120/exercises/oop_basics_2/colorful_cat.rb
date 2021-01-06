class Cat
  COLOR = "Orange"

  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def greet
    puts "My name is #{name} and I am #{COLOR}."
  end

end

kitty = Cat.new('Sophie')
kitty.greet