=begin
27. Exponent method
(https://www.codewars.com/kata/5251f63bdc71af49250002d8)
5 kyu
Create a method called "power" that takes two integers and returns the value of the first argument raised to the power of the second.
 Return nil if the second argument is negative.

Note: The ** operator has been disabled.

Examples:
=end

def power(num1, num2)
  return nil if num2 < 0
  return 1 if num2 == 0

  Array.new(num2, num1).reduce(:*)
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil

=begin
input: 2 integers
output: integer
- 1st int raised to the power of the 2nd

Algorithm 
- Create a method power that takes num1 and num2
  - if num2 is - then return nil
  - create an array of num2 length filled with num1
  - multiply the elements in the array
=end
