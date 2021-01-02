=begin
30. Anagram difference
(https://www.codewars.com/kata/5b1b27c8f60e99a467000041)
6 kyu
Given two words, how many letters do you have to remove from them to make them anagrams?
Example
First word : c od e w ar s (4 letters removed)
Second word : ha c k er r a nk (6 letters removed)
Result : 10
Hints
A word is an anagram of another word if they have the same letters (usually in a different order).
Do not worry about case. All inputs will be lowercase.


def anagram_difference(string1, string2)
  count = 0
  ("a".."z").each do |letter|
    difference = (string1.count(letter) - string2.count(letter)).abs
    count += difference
  end
  
  count
  
end
=end

def anagram_difference(str1, str2)
  non_shared = []
  longest = if str1.length > str2.length
    str1.length
  else
    str2.length
  end

  longest.times do |index|
    char = str1[index]
    unless char.nil? || char == '*'
      if str2.include?(char)
        str2.sub!(char, '*')
        str1.sub!(char, '*')
      else
        non_shared << char
      end
    end

    char = str2[index]
    unless char.nil? || char == '*'
      if str1.include?(char)
        str2.sub!(char, '*')
        str1.sub!(char, '*')
      else
        non_shared << char
      end
    end
  end

  non_shared.length
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10

=begin
input: 2 strings
output: integer
- inputs are each words
- return value is the amount of letters that are removed

p anagram_difference('ab', 'cd') == 4
counter = 0
non_shared = [a, c, b, d]

loop through longer array
  a included in cd? NO
  c included in ab? NO
  b included in cd? NO
  d included in ab? NO

p anagram_difference('aab', 'a') == 2
a, a, b
a
non_shared = [a, b]

loop through the longer array
  a included in a? Yes - Sub a for * in long array and short array

  a included in *? No
  b included in *? NO

p anagram_difference('codewars', 'hackerrank') == 10
codewars
hackerrank
non_shared = [h, o, d, k, w, r, a, s n, k]

loop through the longer one (hackerrank)
  h included in codewars? NO
  c included in hackerrank? Yes 
    - codewars => *odewars
    - hackerrank => ha*kerrank
  a include in codewars? Ye
    - *odewars => *odew*rs
    - ha*kerrank => h**kerrank
  o included in h**kerrank? No
  * should be skipped
  d included in h**kerrank? No
  k included in *odew*rs? No
  e included in h**kerrank? Yes
    -h**kerrank? => h**k*rrank?
    -*odew*rs => *od*w*rs
  * should be skipped
  w included in  h**k*rrank? No
  r included in *od*w*rs? Yes
    - *od*w*rs => *od*w**s
    - h**k*rrank => h**k**rank
  * should be skiped
  r included in *od*w**s? NO
  * should be skipped
  a included in *od*w**s? No
  s included in h**k**rank? No
  n included in *od*w**s? No
  nil should be skipped
  k included in *od*w**s? NO
  nil should be skipped

Algorithm
- Create a method anagram_difference that takes str1 and str2
  - if str1.chars.sort matches str2.chars.sort then return 0
  - non_shared = []
  - longest is equal to the return value of an if statement compairing the lengths of str1 and str2
  - loop longest number of times
    - look at the index of str1 and see if the letter is included in str2? (skip nils and *)
      - if it is then sub the letter str1 letter out of both strings and replaces it with *
      - if it isn't add the letter to non_shared
    - look at the index of str2 and see if the letter is included in str1?
  - return the length of non_shared
=end
