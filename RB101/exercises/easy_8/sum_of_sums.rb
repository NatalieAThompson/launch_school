# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. 
# You may assume that the Array always contains at least one number.

def sum_of_sums(ar)
  sum = 0
  ar.each.with_index do |_, index|
    sum += ar[0..index].sum
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

=begin
input: array
output: integer
-start sum equal to the first number of the array
-add the 1st and 2nd number to sum
-add the 1st, 2nd, 3rd number to sum
-add the 1st, 2nd, 3rd, 4th number to sum

Algorithm
initalize sum to 0
loop with index through ar
  sum the 0 index up to current index and add that to sum
return sum
=end