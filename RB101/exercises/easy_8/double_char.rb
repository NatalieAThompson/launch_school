# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(str)
  new_str = ''

  str.each_char do |char|
    new_str << char * 2
  end
  new_str
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

=begin
input: str
output: str
- double every character in a string

Algorithm
Initalize an empty string `new_str`
loop through str
  add str char * 2 to `new_str`
return new_str
=end