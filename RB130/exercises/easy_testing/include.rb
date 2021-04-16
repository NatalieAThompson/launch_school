# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

require "minitest/autorun"

class IncludeTest < MiniTest::Test
  def test_value
    assert_includes(['abc'], 'xyz')
  end
end