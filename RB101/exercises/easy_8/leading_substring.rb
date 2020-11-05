# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. 
# The return value should be arranged in order from shortest to longest substring.

def leading_substrings(str)
  ar = []

  str.each_char.with_index do |char, index|
    ar << str[0..index]
  end
  ar
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

=begin
input: string
output: array

Algorithm
Initalize and empty ar `ar`
loop through str with index
  add the 0 index up to the current index to the array
return `ar`
=end