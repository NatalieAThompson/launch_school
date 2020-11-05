# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(str)
  str.split[-2]
end


p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

=begin
input: string
output: string
-input string will always contain 2 words
-words are any characters surrounded by spaces
-return the 2nd to last word in the string

Algorithm
Initalize `ar` to `str` split on spaces
return ar at the -2 index
=end