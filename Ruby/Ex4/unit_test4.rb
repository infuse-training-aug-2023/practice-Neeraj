require 'test/unit'
require_relative 'ruby4'

class TestSportsManipulator < Test::Unit::TestCase
  def setup
    @manipulator = SportsManipulator.new(['Cricket', 'Football', 'Hockey', 'Ludo', 'Rummy Circle', 'Snake and ledder'])
  end

  def test_skip_sports
    expected_result = ['2:Hockey', '3:Ludo', '4:Rummy Circle', '5:Snake and ledder']
    assert_equal expected_result, @manipulator.skip_sports(2)
  end

  def test_skip_sports_with_zero_count
    expected_result = ['0:Cricket', '1:Football', '2:Hockey', '3:Ludo', '4:Rummy Circle', '5:Snake and ledder']
    assert_equal expected_result, @manipulator.skip_sports(0)
  end

  def test_skip_sports_with_negative_count
    expected_result = ['0:Cricket', '1:Football', '2:Hockey', '3:Ludo', '4:Rummy Circle', '5:Snake and ledder']
    assert_equal expected_result, @manipulator.skip_sports(-2)
  end

  def test_skip_sports_with_count_beyond_length
    expected_result = []
    assert_equal expected_result, @manipulator.skip_sports(10)
  end
end
