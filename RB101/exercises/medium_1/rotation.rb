# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(ar)
  dup_ar = ar.dup
  ele = dup_ar.shift
  dup_ar << ele
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

=begin
input:array
output: array
- move the first index to the end of the array
- Don't mutate the original array

Algorithm
-Create a duplicate of the array
-take off the first element and store it in a variable
-add that variable to the duplicate array
=end

# Write a method that can rotate the last n digits of a number. For example:

def rotate_rightmost_digits(num, amount)
  digits = num.digits.reverse

  part_shifted = rotate_array(digits[-amount..-1])
  part_same = digits[0...-amount]

  new_ar = part_same + part_shifted
  new_ar.join.to_i
end

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.

=begin
input: 2 integers
output: integer
- rotate the last digits of the number
-How would that work?
  -Maybe seperate the letters into an array of digits
    - only pass in the amount of letters as is passed in (so the 2nd number) to the rotate array?
      -735291, 3 pass in 291: push out 912
      -4 pass in 5291: push out 2915 
        -that seems to work

Algorithm
-Create a digits array from the number
-Use the 2nd number(-) as the start point of the start of a new array to pass into rotate_array method
-Concatenate the beginning of the array unused to the return of rotate_array
-Push the numbers together as a string
-covert the number to an int

=end

# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, 
# and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. 
# Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and 
# rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. 
# You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

def max_rotation(num)
  digits = num.digits

  return num if digits.length == 1
  counter = digits.length

  digits.map! do |_|
    new_num = rotate_rightmost_digits(num, counter)
    counter -= 1
    num = new_num
    new_num
  end

  digits[-1]
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

=begin
input: integer
output: integer
-the maximum time the number can rotate is equal to 
  -735291(no numbers locked), 352917(1st num locked), 329175(2 nums locked), 321759(3 num lock), 321597(4 num lock), 321579(5 num lock)
    -only 1 num remains that can't be switched with anything.
    -loop with index? 0 to index is locked numbers (...)exlusive?
-if num is length of 1 return num

Algorithm
-Create a digits array
-If length of array is 1 return input num
-counter to array length
-loop the number of times equal to the array length
  - num % 10 to the power of counter are the numbers to be swaped
  - set_nums = num - nums to be swapped 
  - add the set_nums and the new swapped nums


=end