# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, 
# false otherwise. Characters that are not alphabetic should be ignored.

def uppercase?(str)
  str.each_char do |char|
    return false unless char.upcase == char
  end

  true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

=begin
input: String
output: boolean
-return true if all the letters are uppercase
-ignore letters that are not alphabetic

Algorithm
loop through the input string
  -Check if the letter is uppercase
    -If one isn't return false
return true if it gets through the loop
=end