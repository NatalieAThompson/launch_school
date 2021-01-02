=begin
32. Highest Scoring Word
(https://www.codewars.com/kata/57eb8fcdf670e99d9b000272)
6 kyu
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.
=end

ALPHABET = Array("`".."z")

def high(str)
  words = str.split
  values = words.map do |word|
    word.chars.reduce(0) do |sum, char|
      sum + ALPHABET.find_index(char)
    end
  end

  index = values.find_index(values.max)
  words[index]
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'

=begin
input: string
output: string
- return the word that scored the most points
  - words are characters surrounded by spaces
- points are scored based on position in alphebet
- all words are lowercase letters

Algorithm
- Create a method high that takes in a str
  - break the str into an array of characters 'words'
  - create a new array based on the words array  `values`
    - for each word in words loop through the letters
      - find the values of each letter 
      - add those values together 
  - find the index of the highest number in `values`
  - return the word at that index in `words`
=end
