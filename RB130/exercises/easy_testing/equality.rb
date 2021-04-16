# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

def test(value)
  value.downcase
end

require "minitest/autorun"

class EqualityTest < MiniTest::Test
  def test_value
    assert_equal("xyz", test("abc"))
  end
end