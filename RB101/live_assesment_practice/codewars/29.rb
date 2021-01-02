=begin
29. Split Strings
(https://www.codewars.com/kata/515de9ae9dcfc28eb6000001)
6 kyu
Complete the solution so that it splits the string into pairs of two characters. 
If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore 
('_').
=end

def solution(str)
  str += "_".scan(/../)
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []

=begin
input: string
output: array
-
=end
