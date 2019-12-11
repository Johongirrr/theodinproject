require_relative "substrings"
require "test/unit"
 
class TestSubstrings < Test::Unit::TestCase
 
  def test_case_1
    dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    actual = { "below" => 1, "low" => 1 }
    expected = substrings("below", dictionary)
    assert_equal(actual, expected)
  end

  def test_case_2
    dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    actual = { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }
    expected = substrings("Howdy partner, sit down! How's it going?", dictionary)
    assert_equal(actual, expected)
  end
end