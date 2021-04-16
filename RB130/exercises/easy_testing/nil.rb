# Write a minitest assertion that will fail if value is not nil.
require "minitest/autorun"

class EqualityTest < MiniTest::Test
  def test_value
    assert_nil(true)
  end
end