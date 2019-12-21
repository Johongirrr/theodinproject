require_relative './knight'

moves = knight_moves([3,3],[4,3])
puts "You made it in #{moves.length-1} moves! Heres your path:"
moves.each{|move| p move}