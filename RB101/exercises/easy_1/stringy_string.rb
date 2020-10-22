# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. 
# The length of the string should match the given integer.

def stringy(num)
  one_zero = ''

  num.times do |element|
    if element.odd?
      one_zero << '0'
    else
      one_zero << '1'
    end
  end

  one_zero
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


=begin
input: int
output: string
-string should be 1s and 0s
-always start with 1
-the length of the string should match the given int

Data Struct
int, string, range

Algorithm
Create a method `stringy` that takes in an int `num`
  initalize an empty string `one_zero`
  loop `num` amount of times
    if index is even
      add 1 to `one_zero`
    else
      add 0 to 'one_zero'
  return one_zero
=end