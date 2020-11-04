# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. 
# Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

def reverse(ar)
  empty_ar = []

  ar.each {|ele| empty_ar.unshift(ele) }

  empty_ar
end


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

=begin
input: array
output: new array
-don't use reverse

Algorithm
Define a method reverse that takes in `ar`
  - initialize an empty_ar 
  - loop through 'ar'
    -add the values into empty_ar 
      -make sure to add them to the beginning of the `empty_ar`
  -return empty_ar
=end