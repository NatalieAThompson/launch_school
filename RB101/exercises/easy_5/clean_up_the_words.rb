# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, 
# write a method that returns that string with all of the non-alphabetic characters replaced by spaces. 
# If one or more non-alphabetic characters occur in a row, you should only have one space in the result 
# (the result should never have consecutive spaces).

def cleanup(str)
  str.squeeze!("^a-z")
     .each_char.with_index { |char, index| str[index] = ' ' unless Array('a'..'z').include?(char) }
     .squeeze!(' ')
  str
end

a = "---what's my +*& line?"

p cleanup(a) == ' what s my line '
p cleanup("---moose   go  *** boom") == ' moose go boom'
p a

=begin
input: string
output: same string
-mutate the original string
-replace all non-slpabetic characters with spaces
-if more than one non-alphabetic character occures in a row only has one space.


Algoritm
-Remove the duplicate non-alphabetic characters
-loop through the string
  - replace any non-alphabetic character with a space
-remove any double spaces
=end