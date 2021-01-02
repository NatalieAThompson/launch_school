# 61. Find the missing letter
# (https://www.codewars.com/kata/5839edaa6754d6fec10000a2)
# 6 kyu
# #Find the missing letter

# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

# You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
# The array will always contain letters in only one case.

# Example:

# ['a','b','c','d','f'] -> 'e' ['O','Q','R','S'] -> 'P'

# ["a","b","c","d","f"] -> "e"
# ["O","Q","R","S"] -> "P"
# (Use the English alphabet with 26 letters!)

# Have fun coding it and please don't forget to vote and rank this kata! :-)

# I have also created other katas. Take a look if you enjoyed this kata!
# =end

def missing_letter(ar)
  char = 0

  ar.each.with_index do |ch, index|
    if index == 0
      char = ch.ord
    else
      unless ch.ord - char == 1
        char = ch.ord
        break
      end
    end
    char = ch.ord
  end

  (char - 1).chr
end

p missing_letter(["a","b","c","d","f"]) == "e"
p missing_letter(["O","Q","R","S"]) == "P"

=begin
input: array (chars)
output: string (char)
- The chars are going to be consecutive but one character will be missing
- if the array is upcase the return will be upcase 
- if the array is lowercase the return will be lowercase

Data Structures
- Use the ord value for confirming the order of the elements
- array
- strings

Algorithm
-Create a method `missing_letter` that takes in `ar`
  -`char` is equal to 0
  -iterate through the array
    -check the ord values
      -keep the ord value of the index before the current index and compare them
        -if the ord value is more than 1 away then we have found the missing character.
        - save current loop .ord to `cha`
        -if we find the missing character break out of the loop
  - Subtract 1 from char
  - Get the character from the ord value in `char`
=end
