class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(str)
    name = str.split
    @first_name = name[0]
    unless name.length == 1
      @last_name = name[1]
    end
  end

  def ==(object)
    name == object.name
  end

  def to_s
    name
  end
end

# Now create a smart name= method that can take just a first name or a full name, 
# and knows how to set the first_name and last_name appropriately.

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob == rob

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"