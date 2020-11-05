# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array 
# that contains the product of each pair of numbers from the arguments that have the same index. 
# You may assume that the arguments contain the same number of elements.

# def multiply_list(ar1, ar2)
#   ar1.map.with_index { |ele, index| ele * ar2[index] }
# end

def multiply_list(ar1, ar2)
  ar1.zip(ar2).map { |sub_ar| sub_ar.reduce(&:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

=begin
input: 2 arrays
output: array
-multiply the numbers in the same index's of each ar
-both arrays with be the same length

Algorithm
Initalize new_ar to an empty array
loop through ar1 with index
  multiple the element with the ar2 at index element
  push that into the new_ar
return new_ar
=end