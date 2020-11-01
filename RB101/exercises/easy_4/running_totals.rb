# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, 
# and each element has the running total from the original Array.

def running_total(given_ar)
  sum_ar = []

  given_ar.each.with_index do |num, index|
    sum_ar << given_ar[0..index].sum
  end

  sum_ar
end


p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

=begin
input: array
output: array

-Should it be a new or the same array?
  -For this problem i'll just say a new array
-The first elements should always be the same
-If the first array is empty the return array is empty
-Add all values including the current index number and any numbers before it

Data Struct
integers, Arrays

Algorithm
- Initalize a new empty array `sum_ar` 
- loop through `given_ar` with an index counter
  - sum the elements in the current index and earlier indexes
  - add that sum to the `sum_ar`
-return `sum_ar`

=end