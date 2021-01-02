# 4.Alphabet symmetry
# (https://www.codewars.com/kata/59d9ff9f7905dfeed50000b0)
# 7 kyu
=begin
Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in 
positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, 
which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

Good luck!

If you like this Kata, please try:

Last digit symmetry

Alternate capitalization

=end

ALPHABET = Array("a".."z")

def solve(string_ar)
  string_ar.map do |string|
    string = string.downcase
    count = 0

    string.each_char.with_index do |letter, index|
      index2 = ALPHABET.find_index(letter)
      count += 1 if index2 == index
    end
    count
  end
  
end

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

=begin
input: array (of strings)
output: array (of integers)
-Count the number of letters that are the same as there Alphebetical position
A and a are the first letter of the alphebet

Aproach
- downcasing the whole string so as not to worry about uppercase letters 
- creating an array to represent the alphebet
  0, 25 index would be a up to z
  How does the count method work?
    - Pass in a block that will count if the return is truthy?
  
    -Need to find the index of the letter in the alphebet and have the index in the string
      - IF they are the same count it

Algorithm
- Create a CONST alphebet that is equal to 'a'-'z'
- Create a method `solve` that takes in str_ar
  - Transform the array based on the characters that match index count. |str|
      count = 0
    - loop through str with |letter, index|
      - index2 = find the index of letter in alphebet
      - if index2 equals index 
        - add 1 to count
    - return count to map
=end
