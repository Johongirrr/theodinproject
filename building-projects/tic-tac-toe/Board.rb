class Board
  attr_accessor :markers
  def initialize
    @markers = {
      0 => nil, 1 => nil, 2 => nil,
      3 => nil, 4 => nil, 5 => nil,
      6 => nil, 7 => nil, 8 => nil
    }
  end

  public 
  def add(index, marker)
    if self.is_empty?(index)
      @markers[index] = marker
      return true
    end
    return false
  end
 
  def display
    puts '-------------------Display-------------------------'
    0.upto(2){|index| print "| #{@markers[index] || index} |"}
    puts ''
    3.upto(5){|index| print "| #{@markers[index] || index} |"}
    puts ''
    6.upto(8){|index| print "| #{@markers[index] || index} |"}
    puts ''
    puts '-------------------Display-------------------------'
  end

  def is_over?
    @markers.all?{|index, marker| marker != nil}
  end

  def end_with_draw?
    mark = self.is_there_a_winner?
    return mark if mark != false
    return true
  end

  def is_empty?(index)
    return @markers[index] == nil
  end

  # return the player mark if there is a winner else return false
  def is_there_a_winner?
    # rows 
    return @markers[0] if @markers[0] == @markers[1] && @markers[1] == @markers[2]
    return @markers[3] if @markers[3] == @markers[4] && @markers[4] == @markers[5]
    return @markers[6] if @markers[6] == @markers[7] && @markers[7] == @markers[8]
    #cols
    return @markers[0] if @markers[0] == @markers[3] && @markers[3] == @markers[6]
    return @markers[1] if @markers[1] == @markers[4] && @markers[4] == @markers[7]
    return @markers[2] if @markers[2] == @markers[5] && @markers[5] == @markers[8]

    #diagonals
    return @markers[0] if @markers[0] == @markers[4] && @markers[4] == @markers[8]
    return @markers[2] if @markers[2] == @markers[4] && @markers[4] == @markers[6]

    return false
  end

end