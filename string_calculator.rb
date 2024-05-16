require 'minitest/autorun'
require "byebug"

class StringCalculator

  def self.add(numbers)
    return 0 if numbers.empty?
  end
end

class TestStringCalculator < Minitest::Test

  def test_returns_0_for_an_empty_string
    assert_equal 0, StringCalculator.add("")
  end

  def test_returns_the_number_itself_for_a_single_number_string
    assert_equal 1, StringCalculator.add("1")
  end
end