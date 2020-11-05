# Write a method that takes a single String argument and returns a new string that contains the original value of the argument
# with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin
input: string
output: string
-capitalize first letter of every word
-words are things surrounded by spaces

Algorithm
-Initalize `ar` to string split on spaces
-loop through `ar`
  -capitalize each element
-join `ar` back together
=end