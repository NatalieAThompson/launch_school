# Write a method that takes two strings as arguments, determines the longest of the two strings, 
# and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. 
# You may assume that the strings are of different lengths.

def short_long_short(str, str2)
  str.length > str2.length ? sprintf('%s%s%s', str2, str, str2) : sprintf('%s%s%s', str, str2, str) 
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

=begin
input: 2 string arguments
output: 1 string
-strings are different lengths 

Algorithm
Compare the length of `str` and `str2`
  if `str` is greater
    combine the strings with two `str2` and one `str`
  else if `str` is lesser
    combine the strings with two `str` and one `str2`
=end