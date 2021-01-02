# 7.Substring fun
# (https://www.codewars.com/kata/565b112d09c1adfdd500019c/train/ruby)
# 7 kyu
=begin
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word which should be returned as a string, 
where n is the position of the word in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.
=end

def nth_char(ar)
  result = ''

  ar.each.with_index do |str, index|
    result << str[index]
  end

  result
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'

=begin
input:array
output: string


Algorithm
- Create a method nth_char that takes an ar
  - initalize return as an empty str
  - loop through ar with |str, index|
    - find the index character of the str and push that into return
  - return return
=end
