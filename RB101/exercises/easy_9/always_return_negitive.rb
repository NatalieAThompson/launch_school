# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. 
# If the number is 0 or negative, return the original number.

def negative(num)
  num <= 0 ? num : -num
end


p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

=begin
input: integer
output: integer
-Return the negitive number of the number passed in
  -If the number is negitive or 0 return the number

Algorithm
Check if the number is less than or equal to 0
  -If so return the number
  -If not return the number multiplied by -1
=end