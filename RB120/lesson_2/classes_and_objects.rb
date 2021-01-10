class Person
  attr_accessor :name, :first_name

  def initialize(name)
    @name = name
    @first_name, @last_name = name.split
  end

  def last_name
    @last_name ? @last_name : ''
  end

  def last_name=(last)
    @last_name = last
    update_name(nil, last)
  end

  def update_name(first, last)
    name = self.name.split
    name[0] = first if first
    name[1] = last if last
    self.name = name.join(" ")
  end
end

# bob = Person.new('bob')
# p bob.name                  # => 'bob'
# bob.name = 'Robert'
# p bob.name                  # => 'Robert'
bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
