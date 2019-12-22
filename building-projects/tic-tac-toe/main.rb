require './lib/game.rb'
require './lib/board.rb'
require './lib/player.rb'


puts 'Welcome To The Tic-Tac-Toe Rubist Game'
puts ''
puts 'Please fill the following information.'
puts ''
print "What is the first player's name: "
player_1_name = gets.chomp 

print "What is the second player's name: "
player_2_name = gets.chomp 
puts ''
puts '*** Starting The Game ***'
puts ''

game = Game.new

player_1 = Player.new(player_1_name, 'X')
player_2 = Player.new(player_2_name, 'O')
board = Board.new

game.run(board, player_1, player_2)