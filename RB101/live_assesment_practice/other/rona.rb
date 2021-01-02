=begin
Create a function that transforms sentences ending with multiple question marks ? or exclamation marks ! into a sentence only ending with one.
Notes
Only change ending punctuation - keep the exclamation marks or question marks in the middle of the sentence the same (see third example).
Don't worry about mixed punctuation (there will be no cases that end in something like ?!??!).
Keep sentences that do not have question/exclamation marks the same.


=end

def no_yelling(str)
  words = str.split
  last_word = words.pop.chars
  
  letters, punctuation = last_word.partition { |char| !['!', '?'].include?(char) }
  letters << punctuation[0] unless punctuation.empty?
  words << letters.join
  words.join(" ")
end

def no_yelling(str)
  words = str.split
  words.last.squeeze!('?!')
  words.join(" ")
end

def no_yelling(string)
  array_of_words = string.split
  last_word = array_of_words.last
  return string if !last_word.include?("!") && !last_word.include?("?")
  if last_word.include?("?")
    squeezed_word = last_word.squeeze("?")
  elsif last_word.include?("!")
    squeezed_word = last_word.squeeze("!")
  end
  array_of_words[0..-2].join(" ") + " " + squeezed_word
end


def no_yelling(str)
  exclamation = 0
  question = 0
  str.chars do |char|
    if char == '!' || char == '?'
      if char == '!'
        exclamation += 1
      elsif char == '?'
        question += 1
      end
    else
      exclamation = 0
      question = 0
    end
  end
  if exclamation > 0
    str[str.length - exclamation..-1] = '!'
  elsif question > 0
    str[str.length - question..-1] = '?'
  end
  str
end

def no_yelling(str)
  idx = str.length - 1 
  arr = str.split('')
  loop do 
    break if !['!','?'].include?(arr[idx])
    if arr[idx - 1] == arr[idx]
      arr.pop
    else 
      break 
    end
    idx -= 1
    break if idx < 1
  end
  arr.join
end

p no_yelling("What went wrong?????????") == "What went wrong?"
p no_yelling("Oh my goodness!!!") == "Oh my goodness!"
p no_yelling("I just!!! can!!! not!!! believe!!! it!!!") == "I just!!! can!!! not!!! believe!!! it!"
p no_yelling("Oh my goodness!") == "Oh my goodness!"
p no_yelling("I just cannot believe it.") == "I just cannot believe it."

=begin
input:string
output: string
- Get ride of multiple !! or ?? at the end of sentances
- Only at end of string

Algorithm
- Create a method no_yelling that takes a str
  - break the str into an array of words 
  - call the last word and break it into an array of characters
    - break it into two variables letters and punctation
    - join it all back togeether with only one value from punctuation
  - return the whole array joined back together
=end