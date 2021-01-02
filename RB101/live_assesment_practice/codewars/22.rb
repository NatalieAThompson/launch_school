=begin
22. Scramblies
(https://www.codewars.com/kata/55c04b4cc56a697bb0000048/train/ruby)
5 kyu
Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, 
otherwise returns false.

Notes:

Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered
Input strings s1 and s2 are null terminated.
=end

def scramble(str1, str2)
  str1_dup = str1.dup

  str2.each_char do |char|
    if str1_dup.include?(char)
      str1_dup.sub!(char, "")
    else
      return false
    end
  end

  true
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true

=begin
input: 2 strings
output: boolean value
- return true if all the characters in string2 are in string1

Algorithm
- Create a method scramble that takes str1 and str2
  - create a dup of str1
  - loop through str2
    - look for the current char in str1 and sub it out if found
    - if it isn't found return false
  - return true
=end
