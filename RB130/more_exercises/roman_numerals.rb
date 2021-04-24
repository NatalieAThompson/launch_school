# Roman Numerals
# The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters have lots of straight lines and are hence easy to hack into stone tablets).
    
#   1  => I
#  10  => X
#   7  => VII
#  50  => L
#  40  => XL
# 100  => C
#  90  => XC
# 500  => D  
# 400  => CD
#1000  => M

# There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals 1990 is MCMXC:

# 1000=M
# 900=CM
# 90=XC

# http://www.novaroma.org/via_romana/numbers.html

# 2000=MM
# 8=VIII

#1042 = 1000 + 40 + 2

=begin
input: integer (self)
output: string
- break the integer into each power of 10
#   1  => I
#  10  => X
#   7  => VII
#  50  => L
#  40  => XL
# 100  => C
#  90  => XC
# 500  => D  
# 400  => CD
#1000  => M

@@values = {
    1=>"I",
    4=>"IV",
    5=>"V",
    9=>"IX",
    10=>"X",
    40=>"XL",
    50=>"L",
    90=>"XC",
    100=>"C",
    400=>"CD",
    500=>"D",
    900=>"CM",
    1000=>"M"
  }

example
'CLXIII', 163.to_roman
- 163
- 100, 60, 3
- CLXIII

'CMXI', 911.to_roman
- 911
- 900, 10, 1
- CM X I

Data Struct
- Hash
- Array
- integer
- strings
- loop

Algo
- Create an a `to_roman` method where the int is represented by self
  - Break digits into 10's array
    - Break self into an array of reversed digits (use digits)
    - loop through that digits array and transform the digit to the 10's place based on the index
      - num * (10 ** index)
    - loop through the transformed array and match the integer with a key from our VALUES constant (map)
    - join the array together
=end


# new_array = []

# loop through the values hash |key, value|
    # loop over 10's array
#   is num == key?
#     new_array << value
#   is num > key?
#     str = ''
#     is num < next_key? (VALUES.values[VALUES.values.find_index(key) + 1])
#       if it is then value is the first part of the string
#         counter = 0
#         additional_str_characters = (num - key) then divide by 10 till the return value is 1 digit long
#         change counter by 1 based on the number of times you divide by 10
#         If the counter is 1 use VALUES[10] * additional_str_characters pushed into str
#         If the counter is 2 use VALUES[100]
#         If the counter is 3 use VALUES[1000]

#       new_array << str
#     next if num > next_key? 
#   # is num < key?

# counter = 1
# 72 LXX 70 - 50 = 20 / 10 = 2

class Integer
  
  VALUES = {
    1=>"I",
    4=>"IV",
    5=>"V",
    9=>"IX",
    10=>"X",
    40=>"XL",
    50=>"L",
    90=>"XC",
    100=>"C",
    400=>"CD",
    500=>"D",
    900=>"CM",
    1000=>"M"
  }
  
  def to_roman
    digits = self.digits
    nums = to_10s_array(digits)
    
    nums.reverse!.each_with_object('') do |num, results|
      results << find_string_match_to_number(num)
    end
  end

  private
  def to_10s_array(digits)
    digits.map.with_index do |digit, idx|
      digit * (10 ** idx)
    end
  end

  def find_string_match_to_number(num)
    VALUES.each do |key, value|
      return value if num == key
        
      if num > key
        next_key = find_next_key_in_hash(key)
        next if num >= next_key
        return create_str(value, num, key)
      end

      return ''
    end
  end

  def create_str(value, num, key)
    str = "#{value}"
        
    counter = 0
    additional_str_chars = num - key
    
    until additional_str_chars.digits.size == 1
      additional_str_chars /= 10
      counter += 1
    end
    
    str << final_str_values(counter, additional_str_chars)
  end

  def find_next_key_in_hash(key)
    VALUES.keys[VALUES.keys.find_index(key) + 1] || 40000
  end

  def final_str_values(counter, additional_str_chars)
    case counter
    when 0 then VALUES[1] * additional_str_chars
    when 1 then VALUES[10] * additional_str_chars
    when 2 then VALUES[100] * additional_str_chars
    when 3 then VALUES[1000] * additional_str_chars
    end
  end
end

require 'minitest/autorun'
# require_relative 'roman_numerals'

class RomanNumeralsTest < Minitest::Test
  def test_1
    assert_equal 'I', 1.to_roman
  end

  def test_2
    assert_equal 'II', 2.to_roman
  end

  def test_3
    assert_equal 'III', 3.to_roman
  end

  def test_4
    assert_equal 'IV', 4.to_roman
  end

  def test_5
    assert_equal 'V', 5.to_roman
  end

  def test_6
    assert_equal 'VI', 6.to_roman
  end

  def test_9
    assert_equal 'IX', 9.to_roman
  end

  def test_27
    assert_equal 'XXVII', 27.to_roman
  end

  def test_48
    assert_equal 'XLVIII', 48.to_roman
  end

  def test_59
    assert_equal 'LIX', 59.to_roman
  end

  def test_93
    assert_equal 'XCIII', 93.to_roman
  end

  def test_141
    assert_equal 'CXLI', 141.to_roman
  end

  def test_163
    assert_equal 'CLXIII', 163.to_roman
  end

  def test_402
    assert_equal 'CDII', 402.to_roman
  end

  def test_575
    assert_equal 'DLXXV', 575.to_roman
  end

  def test_911
    assert_equal 'CMXI', 911.to_roman
  end

  def test_1024
    assert_equal 'MXXIV', 1024.to_roman
  end

  def test_3000
    assert_equal 'MMM', 3000.to_roman
  end
end