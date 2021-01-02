=begin
33. Replace With Alphabet Position
(https://www.codewars.com/kata/546f922b54af40e1e90001da)
6 kyu
In this kata you are required to, given a string, replace every letter with its position in the alphabet.

If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.

Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)
=end

ALPHABET = Array('`'..'z')

def alphabet_position(str)
  numbers = []
  str.downcase.each_char do |char|
    num = ALPHABET.find_index(char)
    numbers << num.to_s unless num.nil? || num == 0
  end

  numbers.join(" ")
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""

=begin
input: str
output: str
- Create a new string of integers that are just the placements of the letters in the alphabet
- ignore anything that isn't a letter
- downcase the string

Algorithm
Create a const ALPHABET = '`' to 'z'
Create a method alphabet_position that takes a string
  - Create a empty string called numbers
  - loop through each character in string
    - find the character in alphabet_position
      - push the index and a space into numbers unless it is nil or 0
  - return numbers
=end
