require_relative '../Player'
require 'test/unit'

class TestPlater < Test::Unit::TestCase
  def test_should_create_player_with_name_and_mark
    nasser = Player.new('Nasser', 'O')
    sabah = Player.new('Sabah', 'X')
    assert_equal('Nasser', nasser.name)
    assert_equal('Sabah', sabah.name)
    assert_equal('O', nasser.mark)
    assert_equal('X', sabah.mark)
  end
end