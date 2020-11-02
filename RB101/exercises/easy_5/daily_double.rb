# Write a method that takes a string argument and returns a new string that contains the value of the original string with all 
# consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

def crunch(str)
  new_str = ''

  str.each_char do |char|
    unless new_str[-1] == char
      new_str << char
    end
  end

  new_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

=begin
input: string
output: new string
-don't use squeeze
-remove any duplicate letters

Algorithm
Create an empty string 'new_str'
loop through each string character
  if the last element in `new_str` is not equal to the current element
    add that element to `new_str`
return `new_str`

=end