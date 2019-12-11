require_relative "bubble_sort"
require "test/unit"
 
class TestBubbleSort < Test::Unit::TestCase
  def test_case_1
    assert_equal([0,2,2,3,4,78], bubble_sort([4,3,78,2,0,2]))
  end
  def test_case_2
    assert_equal([1, 2, 3, 4, 5], bubble_sort([5, 3, 1, 4, 2]))
  end

  def test_case_3
    assert_equal(["hi", "hey", "hello"], bubble_sort_by(["hi","hello","hey"]){|left,right| left.length - right.length})
  end
end