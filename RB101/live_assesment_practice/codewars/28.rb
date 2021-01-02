=begin
28. Where my anagrams at?
(https://www.codewars.com/kata/523a86aa4230ebb5420001e1)
5 kyu
What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

'abba' & 'baab' == true

'abba' & 'bbaa' == true

'abba' & 'abbba' == false

'abba' & 'abca' == false
Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. 
You should return an array of all the anagrams or an empty array if there are none. For example:
=end

def anagrams(str, ar)
  str = str.chars.sort

  ar.select { |word| word.chars.sort == str }
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []

=begin
input: string, array
output: array
- anagrams contain the same letters
- select the wors from the array that are an anagram of the string

Algorithm
- Create a method anagrams that takes str and ar
  - str = The string broken into an array of characters and sorted
  - select the words from ar that when broken into an array of characters and sorted match str
  - return the selection
=end
