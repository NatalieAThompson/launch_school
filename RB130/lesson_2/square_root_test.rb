require "minitest/autorun"

require_relative "square_root"

class SquareRootTest < MiniTest::Test
  def test_that_square_root_of_9_is_3
    result = square_root(9)
    assert_equal 3, result
  end

  def test_square_root_17_is_4
    assert_equal 4, square_root(17)
  end

  def test_square_root_24_is_5
    assert_equal 5, square_root(24)
  end

  def test_square_root_neg_num_is_nil
    assert_nil square_root(-1)
  end
end