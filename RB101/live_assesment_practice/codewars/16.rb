=begin
16. Stop gninnipS My sdroW!
(https://www.codewars.com/kata/5264d2b162488dc400000001)
6 kyu
Write a function that takes in a string of one or more words, and returns the same string, 
but with all five or more letter words reversed (Just like the name of this Kata). 
Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"
=end

def spinWords(str)
  str.split(" ").map { |word| word.length >= 5 ? word.reverse! : word }.join(' ')
end

a = "Hey fellow warriors"
p spinWords(a) == "Hey wollef sroirraw"
p a
p spinWords("This is a test") == "This is a test" 
p spinWords("This is another test") == "This is rehtona test"
p spinWords("test") == "test"

=begin
input: string
output: string
- all 5 or more letter words reversed
- strings will have only letters and spaces
- spaces define words

Algorthm
- Create a method spinWords that takes in str
  - split the string into words
  - loop through the words
    - the the length of the word is 5 or more letters reverse it
=end
