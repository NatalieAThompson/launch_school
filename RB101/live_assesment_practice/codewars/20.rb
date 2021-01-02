=begin
20. Count and Group Character Occurrences in a String
(https://www.codewars.com/kata/543e8390386034b63b001f31)
6 kyu
Write a method that takes a string as an argument and groups the number of times each character appears 
in the string as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}
You should ignore spaces, special characters and count uppercase letters as lowercase ones.
=end

def clean_str(str)
  str.downcase.gsub(/[^a-z0-9]/, '')
end

def get_char_count(str)
  str = clean_str(str).chars
  count = str.group_by { |ele| str.count(ele) }

  count.each do |key, value|
    value.sort!.uniq!
  end

  count.sort.reverse!.to_h
end

p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}

=begin
input: string
output: hash
- create the hash based on the number of times the character appears in the string
- sort the hash by the highest number
- The characters in the hash value array should be sorted alphebeticlly.
- uppercase letters count as lowercase
- symols shouldn't be counted but numbers should

Algorithm
- Create a method get_char_count that takes a str
  - downcase the str
  - remove any non alphabetical letters from the str
  - convert the str into an array
  - create a hash that has the count as the key and the elements in the value as an array that match the key
  - loop through the key value hash and remove any duplicates from the value and sort them alphebetically
  - sort the hash by highest count
=end
