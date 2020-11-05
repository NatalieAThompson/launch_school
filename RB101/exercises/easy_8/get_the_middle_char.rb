# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. 
# If the argument has an odd length, you should return exactly one character. 
# If the argument has an even length, you should return exactly two characters.

def center_of(str)
  length_divided = str.length / 2

  if str.length.odd?
    str[length_divided]
  else
    str[length_divided-1, 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

=begin
input: string
output: string
-if the input string length is odd return 1 character
-if the input string length is even return 2 characters
11/2 = 5 + 1 (get the 6th)
6/2 = 3 (get the 3rd from the front and back)

algorithm
find the str length
if the str length is odd
  divide str by 2
    -return the character in str at that index
if even
  divide str by 2 - 1
    -return the char at that index and the negitive index
=end