# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. 
# The ASCII string value is the sum of the ASCII values of every character in the string. 
# (You may use String#ord to determine the ASCII value of a character.)

def ascii_value(str)
  return 0 if str.empty?
  num_values = []

  str.each_char do |char|
    num_values.push(char.ord)
  end

  num_values.sum
end


p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

=begin
input: String
output: integer
- sum of the ASCII values of the string characters
- use String#ord
- an empty string should = 0

Algorithm
-Create a method `ascii_value` that takes in a string `str`
  - Check if the string is empty
    - If it is return 0
  - Create an empty array `num_values`
  - loop through the string characters
    -add the value of the string character to `num_values`
-return the sum of `num_values`
=end