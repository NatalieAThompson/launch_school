# 6.Non-even substrings
# (https://www.codewars.com/kata/59da47fa27ee00a8b90000b4/train/ruby)
# 6 kyu
=begin
Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

solve("1341") = 7. See test cases for more examples.
=end

def find_substrings(str)
  substrings = []
  str.each_char.with_index do |_, index|
    str.each_char.with_index do |_, index2|
      if index <= index2
        substrings << str[index..index2].to_i
      end
    end
  end
  substrings
end

def solve(str)
  substrings = find_substrings(str).sort

  substrings.count { |num| num.odd? }
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

=begin
input: string
output: integer
- Find the substrings that are of odd length

Algorithm
- Create a method solve that takes a str
  - Find all the substrings
  - count the substrings that are an odd number
=end
