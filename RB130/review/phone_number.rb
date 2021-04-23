# require "minitest/autorun"

# Write a function that accepts an array of 10 integers (between 0 and 9), that returns a string of those numbers in the form of a phone number.
# Example:

# createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) # => returns "(123) 456-7890"


def create_phone_number(ar)
  ar2 = ar.map(&:to_s)
  phone_number = "(___) ___-____"

  phone_number.chars.reduce("") do |str, ele|
    if ele == "_"
      str << ar2.shift
    else
      str << ele
    end
  end
end

p create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) #== "(123) 456-7890"
# p "(111) 111-1111" == create_phone_number([1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
# p "(123) 456-7890" == create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])

# The returned format must be correct in order to complete this challenge.
# Don't forget the space after the closing parentheses!

# class PhoneTest < Minitest::Test
#   def test_number
#     assert_equal("(123) 456-7890", create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]))
#     assert_equal("(111) 111-1111", create_phone_number([1, 1, 1, 1, 1, 1, 1, 1, 1, 1]))
#     assert_equal("(123) 456-7890", create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]))
#   end
# end

=begin
input: array
ouptut: string
- the array has 10 elements
=end
