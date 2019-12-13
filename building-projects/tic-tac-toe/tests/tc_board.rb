require_relative '../Board'
require 'test/unit'

class TestBoard < Test::Unit::TestCase

  def test_it_should_return_the_winner_mark
    board = Board.new
    board.marks = {
      0 => 'X', 1 => 'O', 2 => 'O',
      3 => nil, 4 => 'X', 5 => 'O',
      6 => nil, 7 => nil, 8 => 'X'
    }
    assert_equal('X', board.is_there_a_winner?)
  end

  def test_it_should_return_true_as_a_draw
    board = Board.new
    board.marks = {
      0 => 'X', 1 => 'O', 2 => 'O',
      3 => 'O', 4 => 'X', 5 => 'X',
      6 => 'X', 7 => 'O', 8 => 'O'
    }
    assert_equal(true, board.end_with_draw?)
  end

  def test_it_should_tell_if_the_game_is_over
    board = Board.new
    board.marks = {
      0 => 'X', 1 => 'O', 2 => 'O',
      3 => 'O', 4 => nil, 5 => 'X',
      6 => 'X', 7 => 'O', 8 => 'O'
    }
    assert_equal(false, board.is_over?)
    board.add(4, 'O')
    assert_equal(true, board.is_over?)
  end
  
  def test_it_should_add_marker_to_the_board
    board = Board.new
    assert_equal(nil, board.marks[0])
    assert_equal(true, board.add(0, 'X'))
    assert_equal('X', board.marks[0])
  end

  def test_it_should_return_false_when_add_marker_to_already_filled_index
    board = Board.new
    board.marks[0] = 'X'
    assert_equal(false, board.add(0, 'O'))
  end

  def test_it_should_return_whatever_the_board_is_empty
    board = Board.new
    assert_equal(true, board.is_empty?(0))
    board.marks[0] = 'X'
    assert_equal(false, board.is_empty?(0))
  end
end