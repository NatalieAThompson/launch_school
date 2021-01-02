=begin
35. Mexican Wave
(https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/ruby)
6 kyu

In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
Rules
 	1.  The input string will always be lower case but maybe empty.
2.  If the character in the string is whitespace then pass over it as if it was an empty seat.
=end

def wave(str)
  result = []
  str_dup = str.dup

  str_dup.each_char.with_index do |char, index|
    unless char == " "
      str_dup[index] = char.upcase
      result << str_dup
      str_dup = str.dup
    end
  end

  result
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

=begin
input: string
output: array
- Create an array with the string repeated but the index of the array indicates which letter is upcase

Algorithm
- Create a method wave that takes a str
  - Create an empty array `result`
  - create `str_dup` that is a duplicate of str
  - loop through str_dup on each character with index
    - use index reassignement to change the letter at the current index
      - push the string with the uppercase letter into result
    - reassign `str_dup` back to a duplicate of str
  - return result
=end
