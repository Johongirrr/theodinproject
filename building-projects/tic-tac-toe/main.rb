require_relative 'Game'
require_relative 'Board'
require_relative 'Player'


puts 'Welcome the the Tic-Tac-Toe Game'
print 'Please enter the first player name: '
player_1_name = gets.chomp 

print 'Please enter the second player name: '
player_2_name = gets.chomp 

game = Game.new

player_1 = Player.new(player_1_name, 'X')
player_2 = Player.new(player_2_name, 'O')
board = Board.new

game.run(board, player_1, player_2)