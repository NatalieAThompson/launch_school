# Write a method that computes the difference between the square of the sum of the first n positive integers 
# and the sum of the squares of the first n positive integers.
def sum_squared(num)
  Array(1..num).sum**2
end

def squared_sum(num)
  Array(1..num).map { |n| n**2 }.sum
end

def sum_square_difference(num)
  sum_squared(num) - squared_sum(num)
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

=begin
input: integer
output: integer
-get square of the sum of first n positive ints
-the sum of the squares of the first n positive integers
Subtract them

Examples
-Always start at 1
-Count up to n
-Always subtract the sum squared from the squared sum

Algorithm
Sum Squared - Squared Sum

Sum Squared
  -create an arrray of 1 to num
  -sum that array
  -Square the number

Squared Sum
  -create an array of 1 to num
  -loop through the array and change all the values to the squared values
  -sum the new array
=end