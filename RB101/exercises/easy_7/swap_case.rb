# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by 
# its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

def swapcase(str)
  new_str = ''

  str.each_char do |char|
    if char == char.upcase
      new_str << char.downcase
    else
      new_str << char.upcase
    end
  end
  
  new_str
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

=begin
input: string
output: string
-don't use swapcase method

Algorithm
Initalize `new_str` to empty string
loop through `str`
  if the character is equal to character uppercase 
    push the lowercase version to `new_str`
  else push the uppercase version to `new_str`
return `new_str`
=end