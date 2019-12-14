require_relative '../game'
require 'test/unit'

class TestGame < Test::Unit::TestCase

  def test_should_return_secret_word_with_length_between_5_and_12
    game = Game.new('5desk.txt')
    game.save_names
    assert_true(game.secret_word.length >= 5 && game.secret_word.length <= 12 )
    assert_true(game.secret_word.length >= 5 && game.secret_word.length <= 12 )
    assert_true(game.secret_word.length >= 5 && game.secret_word.length <= 12 )
    assert_true(game.secret_word.length >= 5 && game.secret_word.length <= 12 )
  end

end
