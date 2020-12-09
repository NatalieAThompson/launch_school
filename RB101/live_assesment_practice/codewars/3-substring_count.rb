# 3.Return substring instance count
# (https://www.codewars.com/kata/5168b125faced29f66000005/train/ruby)
# 7 kyu
=begin
Return substring instance count
Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1
=end

def solution(string, substring)
  length_of_sub = substring.length
  substrings = []

  string.each_char.with_index do |_, index|
    substrings << string[index, length_of_sub]
  end
  p substrings

  count = 0

  substrings.each do |combos|
    count += 1 if combos == substring
  end

  count
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

=begin
input: 2 strings
output: integer
-find the amount of times the pattern is in the string
-substring can be any number of characters

Algorithm
-Create a method `solution` that takes `string`, `substring`
  -find the `length_of_substring`
  -Create a new empty array `substrings`
  -loop through `string` with index (`_`, `index`)
    - split the string from the current index to the `length_of_substring`
    - add those splits to `substrings`
  -Create `count` that equals 0
  -loop through `substrings` with `combos`
    -compare `combos` to `substring`
    -If they match add 1 to count
  -return `count`
=end
