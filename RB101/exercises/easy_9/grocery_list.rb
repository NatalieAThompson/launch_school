# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

def buy_fruit(nested)
  numbers, words = nested.flatten.partition { |ele| ele.is_a? Integer }
  new_ar = []

  words.each.with_index do |word, index|
    new_ar << [word] * numbers[index]
  end

  new_ar.flatten
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

=begin
input: nested array
output: array
- The nested array holds a word and the number of times to include that word in a new array

Algorithm
-Create an array of words with the words from nested array
-Create an array of numbers from the numbers from nested array
-initalize an empty array
-loop through words array with index
  add the word to the empty array the number of times the numbers array at the same index says
-return the empty array
=end