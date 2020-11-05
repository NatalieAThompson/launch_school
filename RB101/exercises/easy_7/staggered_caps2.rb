# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should 
# uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; 
# they just don't count when toggling the desired case.

LETTER = *('A'..'Z'), *('a'..'z')

def staggered_case(str)
  new_str = ''
  upper = true

  str.each_char do |char|
    unless LETTER.include?(char)
      new_str << char
      next
    end

    upper ? new_str << char.upcase : new_str << char.downcase
    upper = !upper
  end

  new_str
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

=begin
input: string
output: string
-ignore non-aphabetic characters with the pattern upper, lower, upper
  -so if there is a space or - then that pauses the sequence

Algorithm
Initialize CONST letter to A-Za-z
Initialize `new_str` to an empty string
Initialize upper to true
loop through `str` on `char`
  unless `char` is in `letter`
    add char to new_str
    next
  if upper is true
    add char upcased to new_str
  else
    add char lowercased to new_str

  Set upper to the oppisite of what it equals
return new_str
=end