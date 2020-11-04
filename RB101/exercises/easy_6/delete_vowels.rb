#Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

def remove_vowels(ar)
  ar.map { |words| words.delete('AEIOUaeiou') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

=begin
input: array
input: array
-remove the vowels from the strings in the array

examples
-if there is a word of all vowels, make sure the array slot is an empty string

Algorithm
-Define a method `remove_vowels` that takes in `ar`
  -loop through the array of `words`
    -each word delete the vowels
=end
