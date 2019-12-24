class Game
  public
  def run(board, player_1, player_2)
    clear = true
    while true
      puts `clear` if clear 
      board.display
      puts self.turn_message(player_1)
      index = gets.chomp.to_i
      if index < 0 || index > 6
        puts '**Please insert index between 0 and 6**'.center(45) 
        clear = false
        next
      end
      
      added = board.add(index, player_1.piece)
      if not added
        puts '**Please make sure the column is valid**'.center(45) 
        clear = false
        next
      end
      clear = true
      board.display
      break if self.gameOver?(board, player_1, player_2)
      puts self.turn_message(player_2)
      index = gets.chomp.to_i
      board.add(index, player_2.piece)
      board.display
      break if self.gameOver?(board, player_1, player_2)
    end
  end
  
  def turn_message(player) 
    return "#{player.name}'s turn with #{player.piece} piece, Which column you want to fill:"
  end

  def winner_message(name)
    message = " ******************** WINNER ******************** \n"
    message += "** #{name} won the game.**\n"
    message += " ************************************************ \n"
    return message
  end

  def gameOver?(board, player_1, player_2)
    checkWinerPiece = board.winner?
    if checkWinerPiece
      if checkWinerPiece != false
        name = checkWinerPiece == player_1.piece ? player_1.name : player_2.name
        puts self.winner_message(name)
      end
      return true
    end
    if board.full?
      puts "Game over with a draw"
      return true
    end
    return false
  end
end