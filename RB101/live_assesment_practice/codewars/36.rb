=begin
36. Delete a Digit
(https://www.codewars.com/kata/5894318275f2c75695000146/train/ruby)
6 kyu
Task
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

Example
For n = 152, the output should be 52;

For n = 1001, the output should be 101.

Input/Output
[input] integer n

Constraints: 10 ≤ n ≤ 1000000.

[output] an integer
=end

def delete_digit(num)
  combinations = num.digits.reverse.combination(num.to_s.length - 1).to_a

  combinations.map do |sub_ar|
    sub_ar.join.to_i
  end.max
end

p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1

=begin
input: integer 
output: integer
- delete a digit from the given number and return the highest value result
- Don't change the order of the given integer


=end
