require 'minitest/autorun'
class TestStringCalculator < Minitest::Test

  def test_returns_0_for_an_empty_string
    assert_equal 0, StringCalculator.add("")
  end
end