require_relative '../board'
require 'test/unit'

class TestBoard < Test::Unit::TestCase

  def test_check_method_should_return_correct_hints
    board = Board.new
    computer_code = '9423'
    player_code   = '5734'
    assert_equal(['2 wrong', '2 bad place', '0 correct'], board.check(computer_code, player_code))

    computer_code = '1235'
    player_code   = '1238'
    assert_equal(['1 wrong', '0 bad place', '3 correct'], board.check(computer_code, player_code))
  end

  def test_check_method_should_return_true
    board = Board.new
    computer_code = '9423'
    player_code   = '9423'
    assert_true(board.check(computer_code, player_code))
  end

  def test_should_return_true_for_a_valid_code
    board = Board.new
    assert_true(board.valid_code?('1234'))
    assert_true(board.valid_code?('0000'))
    assert_true(board.valid_code?('9999'))
    assert_true(board.valid_code?('5346'))
    assert_false(board.valid_code?('44444555425'))
  end

  def test_should_generate_a_valid_code
    board = Board.new
    
    assert_true(board.valid_code?(board.new_code))
    assert_true(board.valid_code?(board.new_code))
    assert_true(board.valid_code?(board.new_code))
    assert_true(board.valid_code?(board.new_code))
  end
end