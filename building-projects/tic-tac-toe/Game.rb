=begin
  Responsibilities:
  - Get input and print resuls 
=end
class Game
  def run(board, player_1, player_2)
    while true
      board.display
      puts self.turn_message(player_1)
      index = gets.chomp.to_i
      added = board.add(index, player_1.mark)
      if not added
        puts '**Please make sure the index is available**' 
        next
      end
      board.display
      break if self.gameOver?(board, player_1, player_2)
      puts self.turn_message(player_2)
      index = gets.chomp.to_i
      board.add(index, player_2.mark)
      board.display
      break if self.gameOver?(board, player_1, player_2)
    end
  end
  
  def turn_message(player) 
    return "#{player.name} turn with [#{player.mark}], please which index? :"
  end 
  
  def gameOver?(board, player_1, player_2)
    checkWinerMark = board.is_there_a_winner?
    if checkWinerMark || board.is_over?
      if checkWinerMark != false
        name = checkWinerMark == player_1.mark ? player_1.name : player_2.name
        puts "Game over and the winner is #{name}"
      else
        puts "Game over with a draw"
      end
      return true
    end
    return false
  end
end