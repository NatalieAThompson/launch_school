file = File.open("passage.txt")
file2 = File.open("gutenberg.txt")
# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. 
# Sentences may end with periods (.), exclamation points (!), or question marks (?). 
# Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. 
# You should also print the number of words in the longest sentence.

# The longest sentence in the above text is the last sentence; it is 86 words long. (Note that each -- counts as a word.)

# Another Example

# Download the book at http://www.gutenberg.org/cache/epub/84/pg84.txt, and run your program on this file.

# The longest sentence in this book is 157 words long.

=begin
input: text file
output: integer
-have this code see the text file
=end

def longest_line(text)
  longest_sentance = 0
  sentance_ar = text.lines(/\.|\?|!/)

  sentance_ar.each { |sentance| longest_sentance = sentance.split.length if longest_sentance < sentance.split.length }

  longest_sentance
end

p longest_line(file.read)
p longest_line(file2.read)