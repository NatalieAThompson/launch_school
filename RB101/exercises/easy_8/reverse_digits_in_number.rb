# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. 

def reversed_number(num)
  num.digits.join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
# Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. 
# For similar reasons, the return value for our fourth example doesn't have any leading zeros.

=begin
input: integer
output: integer
-number will be positive
-Don't worry about the leading 0 disappearing

Algorithm
seperate the digits of the number and reverse them
Turn the digits into a string to join them
Turn the string back into a number
=end