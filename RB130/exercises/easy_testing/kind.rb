# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).

require "minitest/autorun"

class KindTest < MiniTest::Test
  def test_value
   assert_kind_of(Numeric, "abc")
  end
end