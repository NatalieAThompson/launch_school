# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. 
# This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. 
# Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

def substrings(str)
  ar = []

  str.each_char.with_index do |char, ind|
    str.each_char.with_index do |char2, ind2|
      if ind == ind2
        ar << char
        next
      end

      if ind > ind2
        next
      end

      ar << str[ind..ind2]
    end
  end
  ar
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

=begin
input: string
output: array
-all substrings
-The array should be ordered by where the substring begins
  -so all index 0 strings first
-Should also be ordered sortest to longest

Algorithm
Initalize an empty array `ar`
loop through str with index `ind`
  loop through str again with index `ind2`
    if both str positions match
      add that to `ar`
    else
      split string at `ind` to `ind2` 
        add that to `ar`
return `ar`
=end