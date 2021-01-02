=begin
19. Title Case
(https://www.codewars.com/kata/5202ef17a402dd033c000009)
6 kyu
A string is considered to be in title case if each word in the string is either (a) capitalised 
(that is, only the first letter of the word is in upper case) or (b) considered to be an exception 
and put entirely into lower case unless it is the first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional list of exceptions (minor words). 
The list of minor words will be given as a string with each word separated by a space. 
Your function should ignore the case of the minor words string -- it should behave in the same way even if the case 
of the minor word string is changed.
=end

def title_case(title, exeptions='')
  title_ar = title.downcase.split
  exeptions = exeptions.downcase.split

  title_ar.map!.with_index do |word, index|
    if index == 0
      word.capitalize
    elsif exeptions.include?(word)
      word.downcase
    else
      word.capitalize
    end
  end.join(" ")
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'

=begin
input: 2 strings
output: string
- Words should be capitalized unless it is an exeption word
- First words should alwasy be capitalized

Algorithm
-Create a method title_case that takes title and exeptions
  - title_ar = the title string split on spaces
  - transform the title_ar with |ele, index|
    - if the index is 0
      - capitalize the word
    - elsif the word is included in the exeptions
      - downcase the word
    - else
      - capitalize the word
  - join the title array back together with spaces
=end
