=begin
Write a method that takes a string as an argument and groups the number of times each character appears in the string as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}
You should ignore spaces, special characters and count uppercase letters as lowercase ones.

p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}
=end


def clean_string(str)
  str.gsub(/[^A-Za-z0-9]/, "")
end

def get_char_count(str)
  array_of_chars = clean_string(str).downcase.chars
  hsh = array_of_chars.group_by { |char| array_of_chars.count(char) }
  
  hsh.map do |key, value|
    [key, value.uniq.sort]
  end.to_h
end

p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}


# // methods: scan, gsub, gsub!
# // A-Z, a-z, 0-9, \/+d\, \/+w\, ^, 