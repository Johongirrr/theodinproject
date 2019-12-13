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
    if self.is_empty?(index)
      @marks[index] = mark
      return true
    end
    return false
  end
 
  def display
    puts '-------------------Display-------------------------'
    0.upto(2){|index| print "| #{@marks[index] || index} |"}
    puts ''
    3.upto(5){|index| print "| #{@marks[index] || index} |"}
    puts ''
    6.upto(8){|index| print "| #{@marks[index] || index} |"}
    puts ''
    puts '-------------------Display-------------------------'
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

  # return the player mark if there is a winner else return false
  def is_there_a_winner?
    # rows 
    return @marks[0] if @marks[0] == @marks[1] && @marks[1] == @marks[2]
    return @marks[3] if @marks[3] == @marks[4] && @marks[4] == @marks[5]
    return @marks[6] if @marks[6] == @marks[7] && @marks[7] == @marks[8]
    #cols
    return @marks[0] if @marks[0] == @marks[3] && @marks[3] == @marks[6]
    return @marks[1] if @marks[1] == @marks[4] && @marks[4] == @marks[7]
    return @marks[2] if @marks[2] == @marks[5] && @marks[5] == @marks[8]

    #diagonals
    return @marks[0] if @marks[0] == @marks[4] && @marks[4] == @marks[8]
    return @marks[2] if @marks[2] == @marks[4] && @marks[4] == @marks[6]

    return false
  end

end