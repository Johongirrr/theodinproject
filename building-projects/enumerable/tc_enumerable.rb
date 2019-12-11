require_relative "enumerable"
require "test/unit"

include Enumerable

class TestEnumerable < Test::Unit::TestCase
  def test_my_each
    assert_equal([2, 4, 6], my_each([1, 2, 3]){|n| n*2})
  end

  def test_my_each_with_index
    assert_equal([2, 5, 8], my_each_with_index([1, 2, 3]){|n, i| n*2+i})
  end

  def test_my_select
    assert_equal([2, 4, 6, 8], my_select([1, 2, 3, 4, 5, 6, 7, 8, 9]){|n| n % 2 == 0 })
  end

  def test_my_map
    assert_equal([2, 3, 4, 5], my_map([1, 2, 3, 4]){|n| n + 1 })
  end
end