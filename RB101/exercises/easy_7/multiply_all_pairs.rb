# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array 
# that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. 
# The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

def multiply_all_pairs(ar1, ar2)
  if ar1.length > ar2.length
    longest = ar1
    shortest = ar2
  else
    longest = ar2
    shortest = ar1
  end

  new_ar = []
  shortest.length.times do |value|
    longest.each { |ele| new_ar << shortest[value] * ele }
  end

  new_ar.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

=begin
input: 2 arrays
output: array
-the return array should be sorted
-neither array will be empty

Algorithm
Set `new_ar` to an empty array
Set long_ar
Set short_ar
loop a number of times equal to sort_ar_length with value
  loop through the long_ar with element
    add short_ar at 0 * element to new_ar
sort new_ar and return it

=end