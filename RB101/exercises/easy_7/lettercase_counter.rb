# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters 
# in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of 
# characters that are neither.

def letter_case_count(str)
  hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  uppercase = *('A'..'Z')
  lowercase = *('a'..'z')

  str.each_char do |char|
    if uppercase.include?(char)
      hsh[:uppercase] += 1
    elsif lowercase.include?(char)
      hsh[:lowercase] += 1
    else
      hsh[:neither] += 1
    end
  end

  hsh
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

=begin
input: string
output: Hash
- hash should have 3 entries
  - lowercase: #
  - uppercase: #
  - neither: #
-spaces and numbers count as neither
-ruby sees numbers, symbols, and spaces as neither up or downcase and will return true on a compairison

Algorithm
-initalize a hash that contains the 3 elements set to 0
-initalize an array a-zA-Z
-loop through `str`
  -check if character is included in array
    -if so check if upcase or downcase
      modifiy hash
    -if not modify hash
-return hash
=end