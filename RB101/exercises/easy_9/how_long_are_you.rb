# Write a method that takes a string as an argument, and returns an Array that contains every word from the string, 
# to which you have appended a space and the word length.

# You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

def word_lengths(str)
  str.split.map { |word| word + " #{word.length}" }
end


p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

=begin
input: string
output: array
-The array should add the length of the word to the same index as the word (add it to the word string)

Algorithm
Create `words` array
  - should be a result of spliting the string into words
Loop through words
  - transform the string to include the length
return the words array
=end