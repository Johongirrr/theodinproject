class Board 
  attr_reader :pieces
  HORIZONTAL = 7
  def initialize
    @pieces = initPieces
  end

  public
  def add(column, value)
    5.downto(0) do |row|
      if @pieces[row][column].nil?
        @pieces[row][column] = value
        return true
      end
    end
    return false
  end
  
  def full?
    0.upto(5) do |row|
      0.upto(6) do |column|
        return false if @pieces[row][column].nil?
      end
    end
    return true
  end

  def winner?
    0.upto(6) do |row|
      0.upto(5) do |column|
        result = check_horizontal(row, column)
        return result if result

        result = check_vertical(row, column)
        return result if result
        
        result = check_diagonal(row, column)
        return result if result
      end
    end
    return false
  end
  
  def display
    puts '*'.center(55, '*')
    puts ' Board '.center(55)
    puts '*'.center(55, '*')
    puts ''
    0.upto(6) do |col|
      print "#{col}".center(8)
    end
    puts ''
    0.upto(5) do |row|
      0.upto(6) do |column|
        if @pieces[row][column].nil?
          print "|   |".center(8)
        else
          print "| #{@pieces[row][column]} |".center(8)
        end
      end
      puts ''
    end
  end
  
  private
  def initPieces
    Array.new(6){Array.new(7)}
  end

  def valid_position?(row, column)
    return (row < 6 && row > -1) && (column < 7 && column > -1)
  end
  
  def check_diagonal(row, column)
    result = check_right_diagonal(row, column)
    return result if result
    
    result = check_left_diagonal(row, column)
    return result if result
    
    result = check_top_diagonal(row, column)
    return result if result
    
    result = check_down_diagonal(row, column)
    return result if result

    return false
  end

  def check_right_diagonal(row, column)
    piece = @pieces[row].nil? ? @pieces[row] : @pieces[row][column]
    return false if piece.nil?
    counter = 1
    if valid_position?(row + 3, column + 3)
      1.upto(3) do |i|
        counter += 1 if piece == @pieces[row + i][column + i]
      end
    end
    if counter == 4
      return piece
    end
    return false
  end

  def check_top_diagonal(row, column)
    piece = @pieces[row].nil? ? @pieces[row] : @pieces[row][column]
    return false if piece.nil?
    counter = 1
    if valid_position?(row - 3, column + 3)
      1.upto(3) do |i|
        counter += 1 if piece == @pieces[row - i][column + i]
      end
    end
    if counter == 4
      return piece
    end
    return false
  end

  def check_down_diagonal(row, column)
    piece = @pieces[row].nil? ? @pieces[row] : @pieces[row][column]
    return false if piece.nil?
    counter = 1
    if valid_position?(row + 3, column - 3)
      1.upto(3) do |i|
        counter += 1 if piece == @pieces[row + i][column - i]
      end
    end
    if counter == 4
      return piece
    end
    return false
  end

  def check_left_diagonal(row, column)
    piece = @pieces[row].nil? ? @pieces[row] : @pieces[row][column]
    return false if piece.nil?
    counter = 1
    if valid_position?(row - 3, column - 3)
      1.upto(3) do |i|
        counter += 1 if piece == @pieces[row - i][column - i]
      end
    end
    if counter == 4
      return piece
    end
    return false
  end

  def check_horizontal(row, column)
    piece = @pieces[row].nil? ? @pieces[row] : @pieces[row][column]
    return false if piece.nil?
    counter = 1
    if valid_position?(row, column + 3)
      1.upto(3) do |i|
        counter += 1 if piece == @pieces[row][column + i]
      end
    end
    if counter == 4
      return piece
    end
    return false
  end

  def check_vertical(row, column)
    piece = @pieces[row].nil? ? @pieces[row] : @pieces[row][column]
    return false if piece.nil?
    counter = 1
    if valid_position?(row + 3, column)
      1.upto(3) do |i|
        counter += 1 if piece == @pieces[row + i][column]
      end
    end
    if counter == 4
      return piece
    end
    return false
  end

end