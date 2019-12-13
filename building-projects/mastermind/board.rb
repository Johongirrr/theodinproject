class Board
  def new_code
    "%04d" % rand(0..9999)
  end

  def check(computer_code, player_code)
    if computer_code != player_code
      wrong = correct = bad_palce = 0
      0.upto(3) do |i|
        player_code.include?(computer_code[i]) ?
          computer_code[i] == player_code[i] ? correct += 1 : bad_palce += 1 : wrong += 1
      end
      return ["#{wrong} wrong", "#{bad_palce} bad place", "#{correct} correct"]
    end
    return true
  end

  def valid_code?(code)
    /^[0-9]{4}$/.match?(code)
  end

end