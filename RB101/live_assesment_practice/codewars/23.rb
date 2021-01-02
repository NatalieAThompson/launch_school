# ***23. Longest alphabetical substring
# (https://www.codewars.com/kata/5a7f58c00025e917f30000f1)
# 6 kyu
# Find the longest substring in alphabetical order.

# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

# The input will only consist of lowercase characters and will be at least one letter long.

# If there are multiple solutions, return the one that appears first.
# =end

# def substrings(str)
#   substrings = []
  
#   0.upto(str.length - 1) do |index|
#     1.upto(str.length - index) do |length|
#       substrings << str[index, length]
#     end
#   end
  
#   substrings
# end

# def longest(str)
#   substring_list = substrings(str)
  
#   substring_list.select! do |string|
#     string.chars.sort == string.chars
#   end
  
#   longest = substring_list.sort_by do |string|
#     string.length
#   end[-1].length
  
#   substring_list.select do |string|
#     string.size == longest
#   end[0]
# end

# def longest(string)
#   current_substring = ''
#   final_substring = string[0]
#   string.each_char.with_index do |char, index|
#     if index == 0
#       current_substring << char
#     elsif current_substring[-1] <= char 
#       current_substring << char
#     else
#       if final_substring.length < current_substring.length
#         final_substring = current_substring
#         current_substring = char 
#       else
#         current_substring = char
#       end
#     end
#   end
#     current_substring.length <= final_substring.length ? final_substring : current_substring
# end

# def longest(str)
#   0.upto(str.size - 1) do |index|
#     1.upto(str.size - index) do |length|
#      return str[index, length] if str[index, length].chars.sort == str[index, length].chars
#     end
#   end
# end

# def longest(str)
#   str.chars.slice_when { |a, b| a > b }
#           .max_by(&:size)
#           .join
# end

def longest(str)
  substring = []
  length = 0
  
  str.each_char.with_index do |char, index|
    str.each_char.with_index do |char2, index2|
      unless index > index2
        sub = str[index..index2]
        if sub.chars == sub.chars.sort
          if sub.length > length
            substring = [sub]
            length = sub.length
          elsif sub.length == length
            substring << sub
          end
        end
      end
    end
  end
  
  substring[0] 
end


p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

=begin
input: string
output: string
- input will only have lowercase letters


Algorithm
-Create a method `longest` that takes `str`
  - substring = []
  - iterate through `str` with |char| (index)
    - interate through `str` with |char2| (index2)
      if index == index2 then don't do anything
      if index > index2 then don't do anything
      look at a slice from index to index2.
        we want to compare it to itself sorted. 
          if it is equal to itself sorted then we can add it to substring
  - find the longest substring and return it (max_by with .size)
=end
