=begin
24. The Hashtag Generator
(https://www.codewars.com/kata/52449b062fb80683ec000024)
5 kyu
The marketing team is spending way too much time typing in hashtags.
Let's help them with our own Hashtag Generator!

Here's the deal:

It must start with a hashtag (#).
All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.
Examples
" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
"    Hello     World   "                  =>  "#HelloWorld"
""                                        =>  false
=end

def generateHashtag(str)
  str = str.split

  str.map!.with_index do |word, index|
    if index == 0
      "#" + word.capitalize
    else
      word.capitalize
    end
  end

  str = str.join

  str.empty? || str.length > 140 ? false : str
end

p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false

=begin
input:
output:
-All words have first letter capitalized
-Should start with a #
return false if the length is > 140 chars
- if input or return value is an empty string return false
- words are split on spaces

Algorithm
- create a method generateHashtag that takes a str
  - str = the str split into an array on spaces
  - transform str with |word, index|
    - if index equals 0 then add a # to the word and capitalize the word
    - else capitalize the word
  - join the words together
  if the retult is empty? or greater than 140 chars in length return false
=end
