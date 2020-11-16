# A collection of spelling blocks has two letters per block, as shown in this list:

# Copy Code
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. 
# Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.
LETTER_SET = %w(b g v x r l d f z c j n h)
LETTER_SET2 = %w(o t i k e y q s m p w a u)

def block_word?(word)
  word = word.downcase
  LETTER_SET.each.with_index do |letter, index|
    if word.include?(letter)
      if word.include?(LETTER_SET2[index])
        return false
      end
    elsif word.include?(LETTER_SET2[index])
      if word.include?(LETTER_SET[index])
        return false
      end
    end
  end

  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

=begin
input string
output: boolean
-uppercase and lowercase strings work
-if there is a b there can't be an o

Data Struct
2 arrays where indexs match

Algorithm
create letter_set = [B, G, V, X, R, L, D, F, Z, C, J, N, H]
create letter_set2 = [O, T, I, K, E, Y, Q, S, M, P, W, A, U]
loop through letter_set
  -Does the word include the letter?
    -if so check if the word includes the letter at the same index in letter_set2
      -if it doesn't move on
      -if it does return false
=end