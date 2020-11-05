# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, 
# with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# def interleave(ar1, ar2)
#   empty_ar = []

#   ar1.each.with_index do |ele, index|
#     empty_ar << ele
#     empty_ar << ar2[index]
#   end

#   empty_ar
# end

def interleave(ar1, ar2)
  ar1.zip(ar2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

=begin
input: 2 arrays
output: array
-both arrays have the same number of elements
-both arrays will not be empty

Algorithm
-initialize `empty_ar`
-loop through `ar1` with index
  -add the first element from `ar1` to `empty_ar`
  -add the current index of `ar2` to `empty_ar`
-return `empty_ar`
=end 