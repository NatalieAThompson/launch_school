# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. 
# The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

def reverse!(ar)
  empty_ar = []

  ar.each { |value| empty_ar << value.dup }

  ar.map!.with_index { |_, index| empty_ar[-(index + 1)] }
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
p list == ["abc"]

list = []
reverse!(list) == []
p list == []

=begin
input: array
output: same array
-don't use .reverse!
-only reverse the order of the array list not any letters in a string
-empty array should return an empty array

Algorithm
Define a method reverse! that takes in `ar`
  -Initalize local variable `empty_ar` 
  -loop through `ar`
    -add a duplicate version of the value to empty_ar
  -loop through `ar` agin
    -set the values of `ar` equal to the `empty_ar` starting from the last index
=end