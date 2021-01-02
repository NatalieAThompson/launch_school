# 9.Typoglycemia Generator
# (https://www.codewars.com/kata/55953e906851cf2441000032/train/ruby)
# 5 kyu

=begin
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation

for reference: http://en.wikipedia.org/wiki/Typoglycemia
=end

def sort_str(str)
  return str if str.length == 1 
  const_letters = [str[0], str[-1]]
  ar = str.chars
  ar.shift
  ar.pop
  
  const_letters[0] + ar.sort.join + const_letters[-1]
end

def special_char(str)
  avaliable_special_chars = "-',."
  special_chars = []
  
  str.each_char.with_index do |char, index|
    if avaliable_special_chars.include?(char)
      special_chars << [index, char]
    end
  end
  
  special_chars
end

def scramble_words(str)
  word = str.split
  
  word.map! do |w|
    special_chars = special_char(w)
    w = w.delete("-',.")
    sorted_word = sort_str(w)
    special_chars.each do |sub_ar|
      sorted_word.insert(sub_ar[0], sub_ar[1])
    end
    sorted_word
  end.join(" ")
end

# def scramble_words(words)
#   words.gsub(/(?<=\w)([^ ]+)(?=\w)/){|a| cs = a.scan(/\w/).sort; a.gsub(/\w/){cs.shift}}
# end

# def scramble_words(words)
#   words.split(' ').map { |word| scramble(word) }.join(' ')  #[ - d c b a]
# end

# def scramble(word)
#   chars = word.chars                        #[ - d c b a]                         
#   letters = chars.select { |char| letter?(char) }         # [ d c b a ]          
#   scrambled_letters = scramble_letters(letters.join).chars  #  d b c  a  --> [dbca]    
#   chars.map do |char|      #[ - d c b a]                                        
#     letter?(char) ? scrambled_letters.shift : char  # [ - d b c a ] --> -dbca  
#   end
#     .join
# end

# def scramble_letters(word)
#   return word if word.length <= 2
  
#   word[0] + word[1...-1].chars.sort.join + word[-1]
# end

# def letter?(char)
#   char.match? /[a-z]/
# end

p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."




=begin
input: string
output: string
-First and last letters are in the right place.
- Sort the middle letters of the string alpabetically
- Punctuation should remain the same
- The string can be a sentance or a word. 
  - for each word in the sentance make sure the words follow the listed rules
  - spaces seperate words
  - The only puctuation used is (-',.)
  - Only deal with lowercase letters
  
Algorithm
- Create a helper method that sorts words individually. `sort_str` takes `str`
  - `const_letters` = [first_letter, last_letter]
  - convert the string to an array
  - remove the first and last letters from the array
  - sort the remaining letters
  - add the first letter to the beginning of the sorted letters 
  - add the last letter to the end of the sorted letters
  - return the new string
  
- Create a helper method that takes a `str` and returns a collection
  - `avaliable_special_chars` = -',.
  - `special_chars` = []
  - loop through the string with index
    - if it doesn't have any special character return an empty array
    - If one of the characters is included in `avaliable_special_chars`
      - add that character and index to the `special_chars` array
  - return `special_chars
  
-Create method `scramble_words` that takes in `str`
  - Create an array of `words` from `str`
  - loop through `words` with `word`
    - transform the word based on the conditions
      - get `special_char` array
      - delete the special_chars from the word
      - `sorted_word` = put word into `sort_str`
      - loop through `special_char` array with |sub_ar|
        - sorted_word insert the subary[1] element at the index in sub_ar[0]
          
=end