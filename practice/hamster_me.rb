# Hamsters are rodents belonging to the subfamily Cricetinae. The subfamily contains about 25 species, classified in six or seven genera. They have become established as popular small house pets, and, partly because they are easy to breed in captivity, hamsters are often used as laboratory animals. Wikipedia Link

# hamster

# And you could have skipped the introduction as it is entirely unrelated to your task. xD

# Task
# Write a function that accepts two inputs: code and message and returns an encrypted string from message using the code.
# The code is a string that generates the key in the way shown below:

#  1  | h a m s t e r
#  2  | i b n   u f
#  3  | j c o   v g
#  4  | k d p   w
#  5  | l   q   x
#  6  |         y
#  7  |         z
# All letters from code get number 1. All letters which directly follow letters from code get number 2 (unless they already have a smaller number assigned), etc. It's difficult to describe but it should be easy to understand from the example below:

#  1  | a e h m r s t
#  2  | b f i n     u
#  3  | c g j o     v
#  4  | d   k p     w
#  5  |     l q     x
#  6  |             y
#  7  |             z
# How does the encoding work using the hamster code?

# a => a1
# b => a2
# c => a3
# d => a4
# e => e1
# f => e2
# ...
# And applying it to strings :

# hamsterMe('hamster', 'hamster')   => h1a1m1s1t1e1r1
# hamsterMe('hamster', 'helpme')    => h1e1h5m4m1e1
# And you probably started wondering what will happen if there is no a in the code.
# Just add these letters after the last available letter (in alphabetic order) in the code.

# The key for code hmster is:

#  1  | e h m r s t
#  2  | f i n     u
#  3  | g j o     v
#  4  |   k p     w
#  5  |   l q     x
#  6  |           y
#  7  |           z
#  8  |           a
#  9  |           b
# 10  |           c
# 11  |           d



# Additional notes
# The code will have at least 1 letter.
# Duplication of letters in code is possible and should be handled.
# The code and message consist of only lowercase letters.

def get_column_hsh(code)
  ar_chars_code = code.chars.sort!
    
  ar_end_alp = Array(ar_chars_code[0].."z")
  ar_begin_alp = Array("a"...ar_chars_code[0])
  alp = ar_end_alp + ar_begin_alp
  
  hamster_code_key = Hash.new([])
  counter = 0
  
  alp.each do |char|
    if ar_chars_code.include?(char)
      counter += 1
    end
    
    if !hamster_code_key.has_key?(counter)
      hamster_code_key[counter] = [char]
    else
      hamster_code_key[counter] << char
    end
  end
    
  hamster_code_key
end

def check_code_key(hamster_code_key, char)
  code = ""
  hamster_code_key.each do |_, v|
    if v.include?(char)
      code << v[0]
      code << (v.index(char) + 1).to_s
    end
  end
  code
end

def hamster_me(code, message)
  hamster_code_key = get_column_hsh(code)
  result = ""
  letters = message.chars
  letters.each do |char| 
    if code.include?(char)
      result << char + "1"
    else
      result << check_code_key(hamster_code_key, char)   
    end
  end
  result
end



p hamster_me("hamster", "hamster") == "h1a1m1s1t1e1r1"
p hamster_me("hamster", "helpme") == "h1e1h5m4m1e1"
p hamster_me("hmster", "hamster") == "h1t8m1s1t1e1r1"

=begin
  initialize a result string ""
  check each letter of the message and see if it matches with a letter in the code
  if it does, append the current letter and a 1 into `result`
  if not, check the `hamster_code_key` to see which array the char is included in,
  then shovel in the first letter of that array and the index + 1 of where the letter is in the array
  return result string
  
=end

# p hamster_me("hhhhammmstteree", "hamster") == "h1a1m1s1t1e1r1"

=begin
input: 2 input (code, message)
output: string
- Transform code into the output
- Code will have at least one letter
- 


# hamster

# create an array of characters from code = [a, e, h, m, r, s, t]
# remove the a
# then loop through the array to make a hash?
  
# ar_end_alp = create another array with all letters from e to z
# ar_begin_alp = create an array a to letter before e
  
# alp = ar_end_alp + ar_begin_alp
  
# e h m r s t -> Hash with numbers as keys
  
# counter = 1
  
# alp.each do |char|
#   is char part of code_array?
#     if it is then add it to the key 1, reset counter to 2
#     if it is not then add it to key counter, add 1 to counter
# end
=end