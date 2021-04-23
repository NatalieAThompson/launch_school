class Speech
  def initialize(str)
    @str = str
  end
  
  def updown_stuff(str)
    result = ''
    
    str.each_char.with_index do |char, index|
      if index.even?
        result << char
      elsif index.odd?
        result << char.upcase
      end
    end
    
    result
  end
  
  def your_method
    ar = @str.split(" ")
    
    ar.map.with_index do |ele, index|
      if (index + 1) % 3 == 0
        updown_stuff(ele)
      elsif ['.', ','].include?(ele[-1])
        new_word = ele.capitalize
        new_word = new_word[0..-2]
        new_word.reverse! + ele[-1]
      else
        ele
      end
    end.join(' ')
  end
end



require "minitest/autorun"

class SpeechTest < Minitest::Test

  def test_1
    speech = Speech.new("One two three four five six seven eight nine ten")
    assert_equal("One two tHrEe four five sIx seven eight nInE ten", speech.your_method)
  end

  def test_2
    speech = Speech.new("I am again called upon by the voice of my country to execute the functions of its Chief Magistrate")
    assert_equal("I am aGaIn called upon bY the voice oF my country tO execute the fUnCtIoNs of its CHiEf Magistrate", speech.your_method)
  end

  def test_3
    speech = Speech.new("On taking this station on a former occasion.")
    assert_equal("On taking tHiS station on a former noisaccO.", speech.your_method)
  end

  def test_4
    speech = Speech.new("Though passion may have strained, it must not break our bonds of affection.")
    assert_equal("Though passion mAy have deniartS, iT must not bReAk our bonds oF noitceffA.", speech.your_method)
  end
end

=begin
input: string
output: string
- every 3rd word in the string should be first letter lowercase, then upcase, switching back and forth
- The rest of the words should stay the same
- Reverse any words that are right before punctuation

Algorithm
-Create a method `your_method` that uses `@str`
  ar = split the @str on spaces
  loop through ar with index (map)
    - if index + 1 % 3 == 0
      - Create a method updown_stuff that takes a str
        - create a result str = ''
        - loop through str with index
          - if index is even 
            - push the lowercase letter of that index to result
          - if index is odd
            - push the uppercase letter of that index to result
        - return result
    - if word ends with punctuation
      - remove the punctuation
      - reverse the word
      - add the punctuation back on
    - if it is neither of those return the word
  - Join the array back into a string
=end