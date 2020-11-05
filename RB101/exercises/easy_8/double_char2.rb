# Write a method that takes a string, and returns a new string in which every consonant character is doubled. 
# Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def double_consonants(str)
  consonants = *('A'..'Z'), *('a'..'z')
  consonants = consonants.join.delete('AEIOUaeiou').chars
  new_str = ''

  str.each_char do |char|
    if consonants.include?(char)
      new_str << char * 2
    else
      new_str << char
    end
  end
  new_str
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

=begin
input: string
output: string
- only double consonants

Algorithm
Create an array with upper and lowercase consonants
Initalize a new_str
loop through str
  -if the consonant array includes the character
    -add char * 2 to new_str
  -else add char to new_str
return new_str

=end