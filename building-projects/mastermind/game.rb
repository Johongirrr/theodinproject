class Game
  ROUNDS = 12
  def run(board)
    round_counter = 1
    computer_code = board.new_code
    while round_counter < 13
      puts "Round #{round_counter}/#{ROUNDS}"
      print "Please enter your code: "
      player_code = gets.chomp
      if not board.valid_code?(player_code)
        puts "The guess code should be 4 length integer, e.g: 1234 or 2222 ..."
        next
      end
      status = board.check(computer_code, player_code)
      if status == true
        puts '****** YOU WOOOON WOHOOOOO! ******'
        break
      else
        puts "Hints: #{status}"
      end
      round_counter += 1
    end
    puts "Game Over, Sorry you reached the last round." if status != true
  end
end