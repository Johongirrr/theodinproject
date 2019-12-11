require_relative "stock_picker"
require "test/unit"
 
class TestStockPicker < Test::Unit::TestCase
 
  def test_case_1
    days = [17,3,6,9,15,8,6,1,10]
    assert_equal([1, 4], stock_picker(days))
  end

  def test_case_2
    days = [17,6,3,1,15,8,20,1,10]
    assert_equal([3, 6], stock_picker(days))
  end

  def test_case_3
    days = [1,6,3,1,15,8,20,1,17]
    assert_equal([0, 6], stock_picker(days))
  end

end