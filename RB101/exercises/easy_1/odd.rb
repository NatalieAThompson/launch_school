# Write a method that takes one integer argument, which may be positive, negative, or zero. 
# This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

def is_odd?(num)
  num % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

=begin
Input: int
Output: boolean

Algorithm
  Create a method `is_odd?` that takes in a `num`
    Divide `num` by 2 and see if there is a remainder
    If there is it is odd
    else it is even
=end

