# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. 
# The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

def average(array_of_num)
  array_of_num.reduce(&:+) / array_of_num.length
end


puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

=begin
input: array of ints
output: int
-array will never be empty
-array will always have positive numbers
-to get average add all the elements and divide by the number of elements

Data Struct
Array, int

Algorithm
Create a method `average` that takes in `array_of_num`
  Sum all the elements of `array_of_num`
  Divide that `sum` by the array length
=end