# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. 
# A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(str)
  str == str.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. 
# This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. 
# If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

def real_palindrome?(str)
  str = str.downcase.delete('^a-zA-Z0-9')
  palindrome?(str)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false