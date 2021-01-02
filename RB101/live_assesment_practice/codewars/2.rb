=begin
Find all pairs

You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)
=end

def pairs(num_ar)
  uniq_ar = num_ar.uniq

  uniq_ar.reduce(0) do |pair, digit|
    pair + (num_ar.count(digit) / 2)
  end
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0


=begin
input: array
output: integer
- If array is empty or equal to 1 return 0
- Pairs of numbers count as 1 count

Algorithm
- Create a method pairs that takes num_ar
  - make an array of uniq digits from num_ar
  - initalize pairs to 0
  - loop through that uniq array with |digit|
    - count the digits in num_ar and divide that number by 2
    - add that result to pairs
  - return pairs
=end