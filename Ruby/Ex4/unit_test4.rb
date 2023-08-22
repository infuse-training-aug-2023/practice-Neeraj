require 'test/unit'
require_relative 'ruby4'

class TestSportsManipulator < Test::Unit::TestCase
  def setup
    @manipulator = SportsManipulator.new(['Cricket', 'Football', 'Hockey', 'Ludo', 'Rummy Circle', 'Snake and ledder'])
  end

  def test_skip_sports
    expected_result = ['Hockey', 'Ludo', 'Rummy Circle', 'Snake and ledder']
    assert_equal expected_result, @manipulator.skip_sports(2)
  end
end
