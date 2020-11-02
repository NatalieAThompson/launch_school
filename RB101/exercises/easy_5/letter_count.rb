# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

def word_sizes(str)
  words = str.split

  hsh = words.group_by {|word| word.length }

  hsh.each do |key, value|
    hsh[key] = value.length
  end
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

=begin
input: string
output: hash
- words are strings surrounded by spaces

Algorithm
-initalize words array to the strings that are split by spaces
-group strings in a hash based on there length
-reassign the key values of the hash to the number of values in the key
=end