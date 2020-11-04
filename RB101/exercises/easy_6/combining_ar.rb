# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. 
# There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

def merge(ar1, ar2)
  ar3 = [ar1, ar2]
  empty_ar = []

  ar3.each do |sub_ar|
    sub_ar.each { |ele| empty_ar << ele unless empty_ar.include?(ele) }
  end

  empty_ar
end


p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

=begin
input: 2 arrays
output: 1 array
-No duplication of values

Algorithm
Define `merge` that takes in `ar1` and `ar2`
  -Create `empty_ar`
  -loop through `ar1` 
    -add the values to `empty_ar` if the value isn't already included
  -loop through 'ar2'
    -Do the same thing
  -return `empty_ar`
=end