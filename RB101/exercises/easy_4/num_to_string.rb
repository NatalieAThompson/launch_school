# In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. 
# In this exercise and the next, you're going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. 
# Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

def integer_to_string(num)
  hsh = {
          0 => '0',
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4',
          5 => '5',
          6 => '6',
          7 => '7',
          8 => '8',
          9 => '9'
        }
  digits = num.digits

  digits.map! do |num|
    hsh[num]
  end

  digits.reverse.join
end


p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

=begin
input: integer
output: string
-positive int or zero

Data Struct
Integers, Strings, hash?, array

Algorithm
Initalize an array of `digits` that is the integer split
Initalize a key value pair collection. 
  keys are numbers values are string versions
loop through `digits`
  change the num to the string version using the collection
Reverse the `digits` array
Join the `digits` array 
return `digits` string
=end

# In the previous exercise, you developed a method that converts non-negative numbers to strings. 
# In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc.
# You may, however, use integer_to_string from the previous exercise.

def signed_integer_to_string(num)
  if num < 0
    num *= -1
    "-#{integer_to_string(num)}"
  elsif num > 0
    "+#{integer_to_string(num)}"
  else
    '0'
  end
end


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

=begin
input: integer
output: string
-positve numbers should have a + in front of the string
-negitive numbers should have a - in front of the string
-0 counts as neither and should be returned as '0'

Data Struct
string, int

Algorithm
Check if number is less than 0
  if it is multiply it by -1 
    run that new number into int_to_string
    add a - to the begining of that returned string
Check if the number is greater than 0
    run the number into int_to_string
    add a + to the begining of the returned string
If neither of those are true return '0'
=end