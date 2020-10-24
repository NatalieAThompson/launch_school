=begin
Input: string
Output: string
-letters have points depeneding on there place in the alphebet
-keep track of the total points of a word
-return the highest point string
-if two are the same return the first one

Data struct:
Hash, strings, array

Algorithm
  Initalize an empty hash `word_points`
  Initalize a abphabet array 
    Keep in mind the point value equals 1 more than index value
  Initalize `array_of_words` that is the input string split into array
  loop through `array_of_words` with |word|
    -We need to find the value of each word and each letter
    initalize sum to 0
    loop through the `word`
      reference the alphabet array to find the value of the letter
        sum += the index in `alphabet` + 1
    if `word_points` does not have the key `word`
      add `word` => `sum` in `word_points`
  Select the hash element with the highest value

=end

def high(str)
  word_points = {}
  alphabet = ('a'..'z').to_a
  array_of_words = str.split

  array_of_words.each do |word|
    sum = 0
    word.each_char do |letter|
      sum += alphabet.find_index(letter) + 1
    end
    if !word_points.include?(word)
      word_points[word] = sum
    end
  end

  max_value = word_points.values.max
  word_points.select { |key, value| value == max_value }
end

p high('man i need a taxi up to ubud') #== 'taxi'
p high('what time are we climbing up the volcano') #== 'volcano'
p high('take me to semynak') #== 'semynak'
p high('aaa b') #== 'aaa'


=begin
Algorithm

Create a method `find_outliner` that takes an array `ar`
  Initalize `first_3` to a new array with the first 3 numbers in `ar`
  Initalize `even' to  the result of Looping through `first_3` and select the even numbers
  if even is equal to 1 then return even
  if even is equal to 0 search `ar` for the even number and return it
  if even is greater than 1 then search `ar` for the odd number and return it
    

=end

def find_outlier(ar)
  first_3 = ar.take(3)
  even = first_3.select { |num| num.even? }

  if even.length == 1
    even[0]
  elsif even.length == 0
    even = ar.select { |num| num.even? }
    even[0]
  else
    odd = ar.select { |num| num.odd? }
    odd[0]
  end
end

p find_outlier([0, 1, 2]) #== 1
p find_outlier([1, 2, 3]) #== 2
p find_outlier([2,6,8,10,3]) #== 3