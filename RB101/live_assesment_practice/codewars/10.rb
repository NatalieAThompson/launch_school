# 10.Most frequently used words in a text]
# (https://www.codewars.com/kata/51e056fe544cf36c410000fb/train/ruby)
# 4 kyu
=begin
Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

Assumptions:
A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. (No need to handle fancy punctuation.)
Matches should be case-insensitive, and the words in the result should be lowercased.
Ties may be broken arbitrarily.
If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.
Examples:
top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"]

top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]

top_3_words("  //wont won't won't")
# => ["won't", "wont"]
Bonus points (not really, but just for fun):
Avoid creating an array whose memory footprint is roughly as big as the input text.
Avoid sorting the entire array of unique words.


input: string
output: array of strings
rules: - return top 3 most occuring words in descending order
       - word: contains letters optionally containing one or more apostrophes (')
       - matches should be case-insensitive
       - single special characters that don't involve letters, are not considered words 
       - if string contains less than 3 unique words, return top 2 or top 1 most used
       - return empty array if string contains no words
       
algorithm: - brainstormed of tasks (we don't know the order yet)
- downcase
-`char =~ /[a-z]/` : checks if the character is a lowercase letter between a and z.
- split the string into an array of words
- clean the string of special characters ---any of them that isn't an apostrophe or a dash

-Create hash with keys being letters/words, and frequency being values (#tally)
-sort hash of clean words by descending value

=end

def contains_letter?(str)
  str.chars.any? do |char|
    char =~ /[a-z]/i
  end
end

def clean_string(str)
  str.each do |word|
    word.gsub!(/[^a-z'-]/, '')
  end
end

def top_3_words(str)
  str = str.downcase
  return [] if !contains_letter?(str)
  
  array_of_words = str.split
  clean_string(array_of_words).delete("")
  
  hash_of_clean_words = array_of_words.tally

  hash_of_clean_words.sort_by {|key, value| value}.reverse.to_h.keys.first(3)
end

# def top_3_words(text)
#   words = text.downcase.scan(/\'?[A-Za-z]+[A-Za-z\']+/) 
#   counts = words.tally
  
#   max_counts = counts.max_by(3) { |word, count| count }
#   max_counts.map(&:first)
# end
  
  #to_h.keys.first(3)


p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]