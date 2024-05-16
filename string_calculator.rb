require 'minitest/autorun'
require "byebug"

class StringCalculator

  def self.add(numbers)
    if numbers.empty?
      return 0
    end
  end
end

class TestStringCalculator < Minitest::Test

  def test_returns_0_for_an_empty_string
    assert_equal 0, StringCalculator.add("")
  end
end