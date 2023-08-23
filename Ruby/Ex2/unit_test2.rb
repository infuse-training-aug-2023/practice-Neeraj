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

  def test_element_at_out_of_bounds
    assert_nil @manipulator.element_at(10)
  end

  def test_exclusive_range_out_of_bounds
    assert_nil @manipulator.exclusive_range(5, 10)
  end

  def test_non_inclusive_range_out_of_bounds
    assert_nil @manipulator.non_inclusive_range(3, 10)
  end

  def test_start_and_length_out_of_bounds
    assert_nil @manipulator.start_and_length(6, 10)
  end
end
