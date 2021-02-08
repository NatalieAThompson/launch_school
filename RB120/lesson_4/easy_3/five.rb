class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model

=begin
On line 12 the local variable `tv` is initialized to an instantiation of `Television`. 
On line 13 the `manufacturer` method is invoked on the istance of `Television` that `tv` is pointing to.
The instance checks its interface for a matching instance method name which does not exist so line 13 would throw
an error.
On line 14 `model` instance method is invoked on `tv`. Which checks the instance objects interface for a method with
the same name. On lines 6 - 8 an instance method is defined and would be accessable as part of the instance interface.
On line 16 the `manufacturer` method is invoked on the Class object `Television` which checks the class for a matching
class method. On lines 2 - 4 the class method is defined. You can tell apart class and instance methods when they are
defined because class methods will list self.method_name.
On line 17 `model` class method is invoke which returns an error because `Television` does not contain a class method
with a matching name.
=end