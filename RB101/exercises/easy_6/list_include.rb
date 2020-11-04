# Write a method named include? that takes an Array and a search value as arguments. 
# This method should return true if the search value is in the array, false if it is not. 
# You may not use the Array#include? method in your solution.

def include?(ar, search_val)
  ar.each { |ele| return true if ele == search_val }
  false
end


p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

=begin
input: array, search value(integer/nil)
output: boolean
-don't use include?

Algorithm
-loop through `ar`
  -compaire each element with search_val
    -if found return true
    -else return false
=end