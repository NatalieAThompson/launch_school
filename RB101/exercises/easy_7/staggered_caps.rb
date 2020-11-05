# Write a method that takes a String as an argument, and returns a new String that contains the original value using a 
# staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. 
# Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

def staggered_case(str)
  new_str = ''

  str.each_char.with_index do |char, index|
    index.even? ? char = char.upcase : char = char.downcase

    new_str << char
  end

  new_str
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

=begin
input: string
output: string
-characters that aren't letters still count in the pattern upper, lower, upper

Algorithm
Initialize `new_str`
loop through `str` with index
  if index is even
    upcase the element
  else
    downcase the element
  push the element to new_str
return new_str

=end