# 8.Repeated Substring
# (https://www.codewars.com/kata/5491689aff74b9b292000334/train/ruby)
# 6 kyu
=begin
For a given nonempty string s find a minimum substring t and the maximum number k, 
such that the entire string s is equal to t repeated k times. The input string consists of lowercase latin letters. 
Your function should return a tuple (in Python) (t, k) or an array (in Ruby and JavaScript) [t, k]

Example #1:

for string

s = "ababab"
the answer is

["ab", 3]
Example #2:

for string

s = "abcde"
the answer is

because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.
=end

def f(str)
  str.each_char.with_index do |letter, index|
    slice = str[0..index]
    amount = str.length / slice.length
    if slice * amount == str
      return [slice, amount]
    end
  end
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

=begin
input: string
output: array [string, integer]
- Find minimume substring (t) and max number (k)
- entire string = t * k

Algorithm
- Create a method f that takes a str
  - result = []
  - loop through each letter in str |letter, index|
    - str[0..index].length * (str.length / str[0..index].length) == str
      - push str[0..index] to result
      - push str.length / str[0..index].length to result
  - return result
=end
