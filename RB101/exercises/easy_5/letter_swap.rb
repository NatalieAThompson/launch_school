# Given a string of words separated by spaces, write a method that takes this string of words and 
# returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. 
# You may also assume that each string contains nothing but words and spaces

def swap(str)
  words = str.split

  words.each do |word|
    # temp = word[0]
    # word[0] = word[-1]
    # word[-1] = temp

    word[0], word[-1] = word[-1], word[0]
  end

  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

=begin
input: string
output: string
-all strings will contain at least a letter
-strings are only words and spaces
-Swap the first and last letter of every word in a string

Algorithm
-Split the `str` into an array of `words`
-loop through `words` looking at `word`
  -Create a `temp` variable to hold the `word` 1st letter
  -Assign the 0 index of word to the last index
  -Assign the last index to the `temp` variable
-Join the `words` back into a string with spaces
-return the string
=end