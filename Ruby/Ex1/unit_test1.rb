require 'test/unit'
require_relative 'ruby1'

class TestSerialAverageCalculator < Test::Unit::TestCase

  def test_correct_input_string
    calculator = SerialAverageCalculator.new("001-12.34-56.78")

    assert_equal "001", calculator.serial_number
    assert_equal 12.34, calculator.xx
    assert_equal 56.78, calculator.yy
    assert_in_delta 34.56, calculator.average, 0.01
    assert_equal "001-34.56", calculator.get_serial_average
  end

  def test_incorrect_input_string_format
    assert_raises(SerialAverageCalculator::InvalidInputFormatError) do
      SerialAverageCalculator.new("invalid-string")
    end
  end

  def setup
    @calculator = SerialAverageCalculator.new("001-12.34-56.78")
  end

  def test_serial_number
    assert_equal "001", @calculator.serial_number
  end

  def test_xx
    assert_equal 12.34, @calculator.xx
  end

  def test_yy
    assert_equal 56.78, @calculator.yy
  end

  def test_average
    assert_in_delta 34.56, @calculator.average, 0.01
  end

  def test_get_serial_average
    assert_equal "001-34.56", @calculator.get_serial_average
  end
end


