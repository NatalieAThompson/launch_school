# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. 
# For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; 
# double numbers should be returned as-is.

def double_number?(num)
  num = num.digits.reverse
  return false if num.length.odd?

  middle_num = num.length / 2
  ar_front = num[0, middle_num]
  ar_end = num[middle_num, middle_num]

  ar_front == ar_end
end

def twice(num)
  return num if double_number?(num) 
  num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

=begin
input: integer
output: integer
-double numbers have an even amount of digits
  -the left side digits and right side digits have to match 103103
-double the number passed in unless it is a double number

Algorithm
check if number is double
  -if it is return the number
  -else multiply it by 2
    -return that

------
double_number? method
seperate the number into digits
check the length of the digits array
  -if the length is odd then return false
Find middle number by dividing the length by 2 (4/2 = 2)
grab the array from the 0 index to the middle number
grab the second halve of the array starting at middle number with length of middle number
compaire that the two arrays are equal.
=end