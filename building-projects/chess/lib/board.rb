class Board
  attr_reader :removed
  attr_accessor :pieces
  def initialize
    @constraints = {
      'rook' => ->(rook, king){
        king_ref = get_ref(king)
        rook_ref = get_ref(rook) 
        return !obstacle?(rook, king) && (king_ref[0] == rook_ref[0] || king_ref[1] == rook_ref[1]) 
      },
    }
    @removed = {'white' => [], 'black' => []}
    @refs = {'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4, 'F' => 5, 'G' => 6, 'H' => 7} 
    @icons = {
      'black_king' => "♔", 'black_queen' => '♕', 'black_knight_1' => '♘', 'black_knight_2' => '♘',
      'black_bishop_1' => '♗', 'black_bishop_2' => '♗', 'black_rook_1' => '♖', 'black_rook_2' => '♖',
      'black_pawn_1' => '♙', 'black_pawn_2' => '♙', 'black_pawn_3' => '♙', 'black_pawn_4' => '♙',
      'black_pawn_5' => '♙', 'black_pawn_6' => '♙', 'black_pawn_7' => '♙', 'black_pawn_8' => '♙',
      'white_king' => "♚", 'white_queen' => '♛', 'white_knight_1' => '♞', 'white_knight_2' => '♞',
      'white_bishop_1' => '♝', 'white_bishop_2' => '♝', 'white_rook_1' => '♜', 'white_rook_2' => '♜',
      'white_pawn_1' => '♟', 'white_pawn_2' => '♟','white_pawn_3' => '♟','white_pawn_4' => '♟',
      'white_pawn_5' => '♟', 'white_pawn_6' => '♟','white_pawn_7' => '♟','white_pawn_8' => '♟',
    }
    @pieces = initPieces
  end
  
  def whois(ref)
    row = calc_row(ref[1]) 
    col = @refs[ref[0]]
    return @pieces[row][col]
  end

  def move(from, to)
    piece = whois(from)
    row = calc_row(to[1])
    col = @refs[to[0]]
    @pieces[row][col] = piece 
    row = calc_row(from[1]) 
    col = @refs[from[0]]
    @pieces[row][col] = nil
  end

  def display
    puts ''
    puts "      A   B   C   D   E   F   G   H"
    0.upto(7) do |i|
      print "#{calc_row(i)}   |"
      0.upto(7) do |j|
        if @pieces[i][j].to_s.length > 0 
          print " #{@icons[@pieces[i][j].to_s]} |".center(4)
        else
          print "   |".center(4)
        end
      end
      puts ''
      print "     -------------------------------"
      puts ''
    end
    puts "      A   B   C   D   E   F   G   H"
  end

  def obstacle?(piece, target)
    piece_ref = get_ref(piece)
    target_ref = get_ref(target)
    piece_row  = piece_ref[0]
    target_row  = target_ref[0]
    piece_col  = piece_ref[1]
    target_col  = target_ref[1]
    if piece.to_s.include?('rook')
      return true if check_rook_vertically(target_row, piece_row, target_col)
      return true if check_rook_horizontally(target_col, piece_col, target_row)
      return false
    end
  end
   
  def check_rook_vertically(target_row, piece_row, col)
    from = target_row > piece_row ? piece_row : target_row 
    to = target_row < piece_row ?  piece_row : target_row
    from += 1
    to -= 1
    from.upto(to) {|row| return true if @pieces[row][col] != nil }
    return false
  end 

  def check_rook_horizontally(target_col, piece_col, row)
    from = target_col > piece_col ? piece_col : target_col 
    to = target_col < piece_col ?  piece_col : target_col 
    from += 1
    to -= 1
    from.upto(to) {|col| return true if @pieces[row][col] != nil }
    return false
  end

  def get_ref(piece)
    0.upto(7) do |row|
      0.upto(7) do |col|
        if piece == @pieces[row][col]
          return [row, col]
        end
      end 
    end
  end
  
  def remove(ref)
    piece = self.whois(ref)
    @removed['white'].push(piece) if piece.to_s.include?('white')
    @removed['black'].push(piece) if piece.to_s.include?('black')
    row = calc_row(ref[1]) 
    col = @refs[ref[0]]
    @pieces[row][col] = nil
  end

  def in_check?(king)
    color =  king.to_s.include?('white') ? 'black' : 'white'
    enemies = []
    @pieces.each{|row| row.each{|piece| enemies.push(piece) if piece.to_s.include?(color)}}
    enemies.each do |enemie|
      return true if can_kill_king?(enemie, king)
    end
    return false
  end

  def can_kill_king?(enemie, king)
    if enemie.to_s.include?('rook')
      return @constraints['rook'].call(enemie, king)
    end
  end
  
  private
  def calc_row(i)
    8 - i.to_i
  end
  
  def initPieces
    return [
      # 0,0 => A8      0,1 => B8       0,2 => C8         0,3 => D8     0,4 => E8    0,5 => F8        0,6 => G8        0,7 => H8
      [:black_rook_1, :black_knight_1, :black_bishop_1, :black_queen, :black_king, :black_bishop_2, :black_knight_2, :black_rook_2], 
      # 1,0 => A7      1,1 => B7       1,2 => C7         1,3 => D7     1,4 => E7    1,5 => F7        1,6 => G7        1,7 => H7
      [:black_pawn_1, :black_pawn_2, :black_pawn_3, :black_pawn_4, :black_pawn_5, :black_pawn_6, :black_pawn_7, :black_pawn_8], 
      [nil, nil, nil, nil, nil, nil, nil, nil], 
      [nil, nil, nil, nil, nil, nil, nil, nil], 
      [nil, nil, nil, nil, nil, nil, nil, nil], 
      [nil, nil, nil, nil, nil, nil, nil, nil], 
      # 6,0 => A2      6,1 => B2       6,2 => C2         6,2 => D2     6,4 => E2    6,5 => F2        6,6 => G2        6,7 => H2
      [:white_pawn_1, :white_pawn_2, :white_pawn_3, :white_pawn_4, :white_pawn_5, :white_pawn_6, :white_pawn_7, :white_pawn_8], 
      # 7,0 => A1      7,1 => B1       7,2 => C1         7,3 => D1     7,4 => E1    7,5 => F1        7,6 => G1        7,7 => H1
      [:white_rook_1, :white_knight_1, :white_bishop_1, :white_queen, :white_king, :white_bishop_2, :white_knight_2, :white_rook_2], 
    ]
  end

end