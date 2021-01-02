# Write a method, alphabetical? that takes a string and returns true if the
# characters in the string are in alphabetical order from left to right.
# The method should be case insensitive and should ignore punctuation and numbers.
# Consecutive repeated characters are okay.

=begin
# Natalie's Solution
def clean_str(str)
  str.downcase.gsub(/[^a-z]/, '')
end

def alphabetical?(str)
  str = clean_str(str)
  str = str.chars
  
  character_value = 0
  
  str.each.with_index do |char, index|
    if index == 0
      character_value = char.ord
    elsif char.ord >= character_value
      character_value = char.ord
    else
      return false
    end
  end
  
  true
end
=end

def alphabetical?(string)
  alphabet = "abcdefghijklmnopqrstuvwxyz".chars
  characters = string.downcase.delete("^a-z").chars
  alphabetical_order = true

  characters.each do |char|
    index = alphabet.find_index(char)

    if index
      alphabet = alphabet.drop(index)
    else
      alphabetical_order = false
      break
    end
  end

  alphabetical_order
end

ALPHABET = [*'a'..'z']

def alphabetical?(str)
  str = str.downcase
  clean_arr = str.chars.select { |char| ALPHABET.include?(char) }
  clean_arr == clean_arr.sort
end 


puts alphabetical?("abc") == true
puts alphabetical?("AbC") == true
puts alphabetical?("a.b_c?") == true
puts alphabetical?("zyx") == false
puts alphabetical?("Eggs") == true
puts alphabetical?("hello") == false

=begin
input: string
output: boolean value
- abcde...
- Ignore puctuation & numbers
- Ignore case
- Its okay to have the same letter in a row aa bbb cc
- Can skip letters as long as the letters that come after are in order

Data Structure
strings
array?
booleans
iteration

Algorithm
-Create a method `alphabetical?` that takes `str`
  - Make a seperate method called `clean_str` takes `str`
    - replace any character that isn't A-Za-z with ''
  - downcase str
  - make str character array
  - initalize `character_value`
  - loop through `str` with `char` and use the index
    - if the index is 0
      - assign character_value to `char`.ord
    - Compaire if the `char`.ord >= character_value
      - if it is reassign character_value to `char`.ord
      - if it isn't return false
  - return true

=end