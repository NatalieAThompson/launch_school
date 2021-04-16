# Write a test that will fail if list and the return value of list.process are different objects.

class List
  def process
    
  end
end

require "minitest/autorun"

class SameTest < MiniTest::Test
  def test_value
  list = List.new
  assert_same(list, list.process)
  end
end