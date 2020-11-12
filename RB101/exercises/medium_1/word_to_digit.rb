# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 
# 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

def word_to_digit(str)
  numbers = %w(zero one two three four five six seven eight nine)
  word_list = str.split

  word_list.map! do |word|
    number = word.delete('.')
    if numbers.include?(number)
      punctation = word.delete(numbers[numbers.find_index(number)])
      "#{numbers.find_index(number)}#{punctation}"
    else
      word
    end
  end

  word_list.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

=begin
input: string
output: string
-replace any words that are numbers with the number five -> 5
-Keep the other words the same
-Make sure to keep any punctuation the same

Algorithm
create a number array = [zero, one...]
create word list array 
loop through word list
  if the word is in the number array 
    replace the word with the index from the numbers array
    check the word for punctation and keep it
join the word list back together
=end