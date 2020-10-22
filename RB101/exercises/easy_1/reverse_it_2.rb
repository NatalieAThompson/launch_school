# Write a method that takes one argument, a string containing one or more words, 
# and returns the given string with words that contain five or more characters reversed. 
# Each string will consist of only letters and spaces. 
# Spaces should be included only when more than one word is present.

def reverse_words(str)
  string_ar = str.split

  string_ar.each do |element|
    if element.length >= 5
      str.gsub!(element, element.reverse)
    end
  end

  str
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS


=begin
Input: string
Output: same string
- mutate the passed in variable

Data Structures:
Strings, Arrays

Algorithm
Create a method `reverse_words` that takes in a string `str`
  Initalize an array `string_ar`
    breaks the string into an array
  loop through `string_ar` with `element`
    if `element` is greater than or equal to 5 characters
      replace the word in the orginal string with `element` reversed

=end