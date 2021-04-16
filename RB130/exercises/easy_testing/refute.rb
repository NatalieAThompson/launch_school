# Write a test that will fail if 'xyz' is one of the elements in the Array list:


require "minitest/autorun"

class IncludeTest < MiniTest::Test
  def test_value
    refute_includes(['abc', 'xyz'], 'xyz')
  end
end