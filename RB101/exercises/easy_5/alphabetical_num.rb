# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers 
# sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, 
# fifteen, sixteen, seventeen, eighteen, nineteen

def alphabetic_number_sort(ar)
  num_string = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

  ar.sort_by! do |digit|
    num_string[digit]
  end
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

=begin
input: array (of ints)
output: array (sorted)
-sort the array based on the words for the numbers

Data Struct
Array, ints, strings

Algorithm
Create an array with the word strings zero - nineteen `num_string`
sort the array by the `num_string` with index of the current num
=end