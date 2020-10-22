#Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

def reverse_sentence(str)
  str.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

=begin
Input: string
Output: new string

Data Structures:
Strings, Arrays

Algorithm:
Create a method `reverse_sentance` that takes a string value `str`
  Initalize `array_of_strings` that splits the string into an array
  Reverse the order of the array
  Join the array back together with spaces
=end