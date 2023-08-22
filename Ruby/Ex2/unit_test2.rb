require 'test/unit'
require_relative 'ruby2' 

class TestArrayManipulator < Test::Unit::TestCase
  def setup
    @arr = [9, 5, 1, 2, 3, 4, 0, -1]
    @manipulator = ArrayManipulator.new(@arr)
  end

  def test_element_at
    assert_equal 3, @manipulator.element_at(4)
  end

  def test_exclusive_range
    assert_equal [1, 2, 3, 4], @manipulator.exclusive_range(2, 5)
  end

  def test_non_inclusive_range
    assert_equal [1, 2, 3], @manipulator.non_inclusive_range(2, 5)
  end

  def test_start_and_length
    assert_equal [2, 3, 4, 0, -1], @manipulator.start_and_length(3, 5)
  end
end
