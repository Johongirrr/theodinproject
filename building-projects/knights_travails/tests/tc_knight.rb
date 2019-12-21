require_relative '../knight'
require 'test/unit'

class TestKnight < Test::Unit::TestCase
  def test_should_return_if_the_given_move_is_valid_or_not
    assert_false(valid_move?([-2, 1], 0, 0))
    assert_true(valid_move?([2, 1], 0, 0))
    assert_false(valid_move?([1, -2], 0, 0))
    assert_true(valid_move?([-1, -2], 1, 2))
  end
  def test_should_return_the_correct_path
    assert_equal([[0,0],[1,2]], knight_moves([0,0],[1,2]))
    assert_equal([[0,0],[1,2],[3,3]], knight_moves([0,0],[3,3]))
    assert_equal([[3,3],[1,2],[0,0]], knight_moves([3, 3],[0,0]))
    assert_equal([[0,0],[1,2],[2, 4],[4, 5]], knight_moves([0,0],[4,5]))
    assert_equal([[3,4],[1,5],[0, 7]], knight_moves([3,4],[0,7]))
    assert_equal([[3,3],[4,5],[6,4],[4,3]], knight_moves([3,3],[4,3]))
  end
end