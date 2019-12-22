require './lib/game.rb'
require './lib/board.rb'
require './lib/player.rb'

describe Game do
  it "tells if the game is over or not yet" do
    game = Game.new
    board = Board.new
    p1 = Player.new('Nasser', 'O')
    p2 = Player.new('Sabah', 'X')
    expect(game.gameOver?(board, p1, p2)).to eql(false)

    board.marks = {
      0 => 'X', 1 => 'O', 2 => 'O',
      3 => 'O', 4 => 'X', 5 => 'X',
      6 => 'X', 7 => 'O', 8 => 'O'
    }
    expect(game.gameOver?(board, p1, p2)).to eql(true)
  end

  it "format who's turn message" do
    game = Game.new
    player = Player.new('Nasser', 'O')
    expect(game.turn_message(player).length > 0).to eql(true)
  end
end
