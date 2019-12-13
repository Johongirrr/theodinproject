require_relative 'game'
require_relative 'board'

puts 'Welcome To The Mastermind Game'
puts 'Playing Rules:'
puts '- You have 12 turns to guess the secret code generate by your computer.'
puts '- The generated code is 4 length integer e.g: 5467.'
puts '- Each round you make a guess the computer will give you hints'
puts ''
puts '*** Starting The Game ***'
puts ''

game = Game.new
board = Board.new
game.run(board)