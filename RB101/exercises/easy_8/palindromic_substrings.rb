# Write a method that returns a list of all substrings of a string that are palindromic. 
# That is, each substring must consist of the same sequence of characters forwards as it does backwards. 
# The return value should be arranged in the same sequence as the substrings appear in the string. 
# Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, 
# "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

def substrings(str)
  ar = []

  str.each_char.with_index do |char, ind|
    str.each_char.with_index do |char2, ind2|
      if ind == ind2
        ar << char
        next
      end

      if ind > ind2
        next
      end

      ar << str[ind..ind2]
    end
  end
  ar
end

def palindromes(str)
  ar = []
  ar_substrings = substrings(str)

  ar_substrings.each do |substring|
    unless substring.length == 1
      if substring == substring.reverse
        ar << substring
      end
    end
  end
  ar
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

=begin
input: string
output: array
-return substrings that a palindromic
  -palindromic means the same forward and backwards
  -duplicate palindromes should be included multiple times
-use the substring method from the previous exercise.
-the palindromes are case sensitive
-single characters are not palindromes

Algorithm
Initalize ar to an empty array
initalize ar_substrings to pass string into substrings
loop through ar_substrings
  check if the substring is more than 1 character
  check if the substring is the same forward and backwards
    -if both are true add it to ar
return ar
=end