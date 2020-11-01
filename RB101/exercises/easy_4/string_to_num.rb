# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. 
# String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. 
# You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. 
# Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.
NUM = %w(0 1 2 3 4 5 6 7 8 9)

def string_to_integer(str)
  char_ar = str.split('')
  num_ar = char_ar.map do |char|
            NUM.find_index(char)
           end

  num_ar = num_ar.map.with_index do |num, index|
            num * (10 ** (num_ar.length - (index + 1)))
           end

  num_ar.sum
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

=begin
input: string
output: integer
-Don't worry about positive or negitive signs
-Don't worry about invalid characters

Data struct
String, Integers, Array

Algorithm
Initalize an array `num` = 0 through 9 in string format
Split the string into characters `char_ar`
create `num_ar` by looping through `char_ar` 
  -Change the string number to the index value in `num`
reassign `num_ar` to the result of looping through `num_ar`
  used the length of `num_ar` - 1 to determine the amount of 0  -  [4, 3, 2, 1] 4 * 10 ** 3
    use the formula x * (10 ** length(index +1))
return `num_ar` summed together
=end

# In the previous exercise, you developed a method that converts simple numeric strings to Integers. 
# In this exercise, you're going to extend that method to work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. 
# The String may have a leading + or - sign; if the first character is a +, 
# your method should return a positive number; if it is a -, your method should return a negative number. 
# If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. 
# You may, however, use the string_to_integer method from the previous lesson.

def string_to_signed_integer(str)
  unless NUM.include?(str[0])
    if str[0] == '-'
      str = str.delete('-')
      return -string_to_integer(str)
    else
      str = str.delete('+')
    end
  end

  string_to_integer(str)
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

=begin
input: string
output: integer
-use str_to_int method
-string may start with -/+ or a number

Data Struct
String, Int

Algorithm
Check if the string starts with a character that isn't a number
  If it does compare the character to - 
    Reassign str to just have digits
    If it is a negitive number call -str_to_int
  If it has a none digit in index 0 then remove it
  run new string in str_to_int


=end