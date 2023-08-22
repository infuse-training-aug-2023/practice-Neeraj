require 'test/unit'
require_relative 'ruby3' 

class TestHashManipulator < Test::Unit::TestCase
  def setup
    @manipulator = HashManipulator.new
    @manipulator.add_key_value_pair(98765, 25)
    @manipulator.add_key_value_pair(123456, 32)
    @manipulator.add_key_value_pair("name", "Neeraj")
    @manipulator.add_key_value_pair(543121, 100)
  end

  def test_select_odd_integer_keys
    expected_result = {
      98765 => 25,
      543121 => 100
    }
    assert_equal expected_result, @manipulator.select_odd_integer_keys
  end
end
