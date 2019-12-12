require_relative '../Game'
require_relative '../Board'
require_relative '../Player'
require 'test/unit'

class TestGame < Test::Unit::TestCase
  def test_should_tell_if_the_game_is_over_or_not_yet
    game = Game.new
    board = Board.new
    p1 = Player.new('Nasser', 'O')
    p2 = Player.new('Sabah', 'X')
    assert_equal(false, game.gameOver?(board, p1, p2))

    board.markers = {
      0 => 'X', 1 => 'O', 2 => 'O',
      3 => 'O', 4 => 'X', 5 => 'X',
      6 => 'X', 7 => 'O', 8 => 'O'
    }
    assert_equal(true, game.gameOver?(board, p1, p2))
  end

  def test_it_should_format_whos_turn_message
    game = Game.new
    p = Player.new('Nasser', 'O')
    assert_true(game.turn_message(p).length > 0)
  end
end
