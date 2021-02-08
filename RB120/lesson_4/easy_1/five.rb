class Fruit
  attr_reader :name
end

class Pizza
  def initialize(name)
    @name = name
  end
end

apple = Fruit.new
pep = Pizza.new("Pep")
p apple.instance_variables
p pep.instance_variables