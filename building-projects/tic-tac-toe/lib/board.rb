class Board
  attr_accessor :marks
  def initialize
    @marks = {
      0 => nil, 1 => nil, 2 => nil,
      3 => nil, 4 => nil, 5 => nil,
      6 => nil, 7 => nil, 8 => nil
    }
  end

  public 
  def add(index, mark)
    if self.is_empty?(index) && is_valid(index)
      @marks[index] = mark
      return true
    end
    return false
  end
 
  def display
    width = 10
    puts '------------------- Board -------------------------'
    0.upto(2){|index| print "| #{@marks[index] || index} |".center(width)}
    puts ''
    3.upto(5){|index| print "| #{@marks[index] || index} |".center(width)}
    puts ''
    6.upto(8){|index| print "| #{@marks[index] || index} |".center(width)}
    puts ''
    puts '---------------------------------------------------'
    puts ''
  end

  def is_over?
    @marks.all?{|index, mark| mark != nil}
  end

  def end_with_draw?
    mark = self.is_there_a_winner?
    return mark if mark != false
    return true
  end

  def is_empty?(index)
    return @marks[index] == nil
  end

  def is_valid(index)
    return index > -1 && index < 9
  end

  # return the player mark if there is a winner else return false
  def is_there_a_winner?
    keys = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], #rows
      [0, 3, 6], [1, 4, 7],[2, 5, 8], #columns
      [0, 4, 8],[2, 4, 6] #diagonals
    ]
    i = 0
    loop do
      break if i > 7 
      return @marks[keys[i][0]] if self.check(keys[i], @marks)
      i += 1
    end
    return false
  end

  def check(keys, marks)
    return marks[keys[0]] if marks[keys[0]] == marks[keys[1]] && marks[keys[1]] == marks[keys[2]]
  end
end