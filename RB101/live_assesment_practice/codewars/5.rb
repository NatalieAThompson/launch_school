# 5.Longest vowel chain 
# (https://www.codewars.com/kata/59c5f4e9d751df43cf000035/train/ruby)
# 7 kyu
=begin
Longest vowel chain
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. 
Given a lowercase string that has alphabetic characters only and no spaces, return the length of the longest vowel substring. 
Vowels are any of aeiou.

=end
VOWELS = %w(a e i o u)

def solve(str)
  longest_vowel = ''
  current_vowel = ''
  new_check = true

  str.each_char do |char|
    if VOWELS.include?(char) && new_check
      longest_vowel = current_vowel if current_vowel.length > longest_vowel.length

      current_vowel = char
      new_check = false
    elsif VOWELS.include?(char)
      current_vowel << char
    else
      new_check = true
    end
  end

  longest_vowel.length > current_vowel.length ? longest_vowel.length : current_vowel.length
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

=begin
input: string
output: integer
- find the longest length of vowels

algorithm
- Create a CONST VOWELS = [a, e, i, o, u]
- Create a method solve that takes a str
  - longest_vowel = ''
  - current_vowel = ''
  - Create a boolean New_check? assign it to true
  - loop through str with |char|
    - check if char is a vowel using the VOWELS && New_check is true
      -Check if current_vowel is longer than longest_vowel
        - if it is assign longest_vowel to current_vowel
      - if it is reassign current_vowel to char
      - New_check = false
    - if it is a vowel and New_check is false
      - push char into current_vowel
    - if char isn't a vowel
      - New_check = true
  - return longest_vowel's length
      
=end
