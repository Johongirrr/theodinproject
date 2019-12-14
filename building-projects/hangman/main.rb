require_relative 'game'
puts "Welcome To Hangman Ruby Game"
puts "The computer have a secret word"
puts "you must guess a letter"
puts "if you want to save the game state enter 'save' as an answer"
puts "if you want to load a saved state enter 'load' as an answer"
game = Game.new('5desk.txt')
game.run()