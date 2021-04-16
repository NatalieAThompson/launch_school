# Write a minitest assertion that will fail if the value.odd? is not true.

def test(value)
  value.odd?
end

require "minitest/autorun"

class BooleanTest < MiniTest::Test
  def test_value
    assert(test(2), 'value is not odd')
  end
end