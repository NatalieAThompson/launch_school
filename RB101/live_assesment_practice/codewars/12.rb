# 12. Detect Pangram
# (https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/ruby)
# 6 kyu
# A pangram is a sentence that contains every single letter of the alphabet at least once. For example, 
#the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

# Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.
# =end
p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

=begin
input: string
output: boolean value
- 
=end
