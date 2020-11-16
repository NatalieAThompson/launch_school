# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, 
# as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of 
# characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, 
# and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

def letter_percentages(str)
  percentage = {lowercase: 0, uppercase: 0, neither: 0}
  str_length = str.size

  str.each_char do |char|
    if Array('A'..'Z').include?(char)
      percentage[:uppercase] += 1
    elsif Array('a'..'z').include?(char)
      percentage[:lowercase] += 1
    else
      percentage[:neither] += 1
    end
  end

  percentage.each do |key, value|
    per = (value.to_f / str_length) * 100
    percentage[key] = per.round(2)
  end

  percentage

end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI')

=begin
input: string
output: hash
-lowercase:, uppercase:, neither: keys
-The values should be percentages

Algorithm
Create a percentage hash that has the keys set to 0
str_length set to the length of the string
loop through the string
  if lowercase add 1 to lowercase key in hash
  if uppercase add 1 to uppercase key in hash
  if neither add 1 to neither key in hash
loop through the hash
  look at the value
    Create a fraction value / str_length * 100
      reasign the value
return the hash
=end