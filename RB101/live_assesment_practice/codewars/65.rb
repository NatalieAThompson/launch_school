=begin
65. Reversing and Combining Text
(https://www.codewars.com/kata/56b861671d36bb0aa8000819/train/ruby)

Your task is to Reverse and Combine Words.

Input: String containing different "words" separated by spaces

1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
  (odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result…
=end

def reverse_and_combine_text(str)
  words = str.split
  
  until words.length == 1
    words.map! { |word| word.reverse }
    temp_ar = []
    index = 0
    loop do
      temp_ar << words[index, 2].join if words[index, 2].join != ""
      
      break if index >= words.length - 1
      index += 2
    end
    
    words = temp_ar
  end
  
  words[0]
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"


=begin
input: string
ouput: string
- words - are seperated by spaces
- If there is more than 1 word. Reverse each word and combine the every other word.
- loop until there is only 1 word.
- return that 1 word

p reverse_and_combine_text("abc def") #== "cbafed"

[cba, def]
temp_ar = []
[cbadef]

temp_ar << words[0,2].join

Algorithm
- Create a method reverse_and_combine_text that takes str
  - words = str split into words on spaces
  - until words.length == 1
    - reverse every word in words
    - reassign words to the combination of index 01, 23, ...
  - return words[0]
=end