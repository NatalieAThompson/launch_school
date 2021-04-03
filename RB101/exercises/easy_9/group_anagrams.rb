# Given the array...

def display_anagrams(ar)
  result_ar = []

  until ar.empty?
    selection = ar.select { |word| ar[0].chars.sort == word.chars.sort }
    ar -= selection
    result_ar << selection
  end

  result_ar.each { |sub_ar| p sub_ar }
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

display_anagrams(words)
# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. 
# Your output should look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc

=begin
input: array
output: (no return value) output arrays to screen
- group words in arrays based on if they are anagrams
- anagrams are words that share the same letters

Examples

loop do
  first_word = 'demo'
  loop through the rest of the words
    -select the words that are equal to first_word sorted
    -push that selection into an array and array subtract those words from the passed in array
  break when ar is empty?
end

Algorithm
Create a method display_anagrams that takes an ar
  result_ar = []
  loop until ar is empty
    - ar_select = the selection of the words that are equal to ar[0] sorted in alp
    - remove the words from ar_select from ar
    - shovel ar_select into result_ar
  loop through result_ar and output the sub_arrays

=end
