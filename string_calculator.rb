require 'minitest/autorun'
require "byebug"

class StringCalculator

  def self.add(numbers)
  if numbers.empty?
      return 0
    elsif numbers.match?(/,\n|\n,|\n\n/)
      return "Invalid input"
    end

    numbers.split(/[,\n]+/).map(&:to_i).sum
    delimiter = ","
      if numbers.start_with?("//")
        delimiter = numbers[2]
        numbers = numbers[4..-1]
      end

    numbers.split(/[,\n#{delimiter}]/).map(&:to_i).sum

  end

end

class TestStringCalculator < Minitest::Test

  def test_returns_0_for_an_empty_string
    assert_equal 0, StringCalculator.add("")
  end

  def test_returns_the_number_itself_for_a_single_number_string
    assert_equal 1, StringCalculator.add("1")
  end

  def test_returns_the_sum_of_numbers_for_comma_separated_numbers
    assert_equal 6, StringCalculator.add("1,2,3")
  end

  def test_handles_new_lines_between_numbers_and_commas
    assert_equal 6, StringCalculator.add("1\n2,3")
  end

  def test_handles_invalid_input_with_newline_after_comma
    assert_equal "Invalid input", StringCalculator.add("1,\n")
  end

  def test_supports_custom_delimiters
    assert_equal 3, StringCalculator.add("//;\n1;2")
  end

  def test_raises_exception_for_negative_numbers
    assert_raises(RuntimeError) { StringCalculator.add("2,-3") }
  end

  def test_exception_message_includes_all_negative_numbers
    error = assert_raises(RuntimeError) { StringCalculator.add("-1,2,-3,-4") }
    assert_equal "Negative numbers not allowed: -1, -3, -4", error.message
  end
end