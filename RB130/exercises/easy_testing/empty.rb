# Write a minitest assertion that will fail if the Array list is not empty.

require "minitest/autorun"

class EmptyTest < MiniTest::Test
  def test_value
    assert_equal([], [1])
  end
end