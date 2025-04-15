require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_returns_0_for_empty_string
    assert_equal 0, @calculator.add("")
  end

  def test_returns_number_for_single_number
    assert_equal 1, @calculator.add("1")
  end

  def test_returns_sum_of_two_numbers
    assert_equal 6, @calculator.add("1, 5")
  end

  def test_returns_sum_of_multiple_numbers
    assert_equal 10, @calculator.add("1, 2, 3, 4")
  end

  def test_handles_newline_as_separator
    assert_equal 6, @calculator.add("1\n2, 3")
  end

  def test_handles_custom_delimiter
    assert_equal 3, @calculator.add("//;\n1;2")
  end

  def test_raises_error_for_negative_number
    error = assert_raises(RuntimeError) { @calculator.add("1, -2, 3") }
    assert_equal "negative numbers not allowed -2", error.message
  end

  def test_raises_error_for_multiple_negative_numbers
    error = assert_raises(RuntimeError) { @calculator.add("1, -2, -3") }
    assert_equal "negative numbers not allowed -2,-3", error.message
  end
end
