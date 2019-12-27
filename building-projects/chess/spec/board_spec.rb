require './lib/board.rb'

describe Board do
  it "returns which piece in the given position" do
    board = Board.new
    expect(board.whois('A1')).to be(:white_rook_1)
    expect(board.whois('B1')).to be(:white_knight_1)
    expect(board.whois('A3')).to be(nil)
    expect(board.whois('A8')).to be(:black_rook_1)
    expect(board.whois('B8')).to be(:black_knight_1)
  end
  it "moves the Knight to the given position" do
    board = Board.new
    expect(board.whois('B1')).to be(:white_knight_1)
    expect(board.whois('A3')).to be(nil)
    board.move('B1', 'A3')
    expect(board.whois('B1')).to be(nil)
    expect(board.whois('A3')).to be(:white_knight_1)
  end

  it "removes the target peice from the board" do
    board = Board.new
    expect(board.whois('B1')).to be(:white_knight_1)
    expect(board.whois('B8')).to be(:black_knight_1)
    expect(board.removed['white'].include?(:white_knight_1)).to be(false)
    expect(board.removed['black'].include?(:black_knight_1)).to be(false)
    board.remove('B1')
    board.remove('B8')
    expect(board.whois('B1')).to be(nil)
    expect(board.whois('B8')).to be(nil)
    expect(board.removed['white'].include?(:white_knight_1)).to be(true)
    expect(board.removed['black'].include?(:black_knight_1)).to be(true)
  end
  it "returns piece position [row, column]" do
    board = Board.new
    rook = board.whois('A1')
    knight = board.whois('B1')
    expect(board.get_ref(rook)).to eql([7, 0])
    expect(board.get_ref(knight)).to eql([7, 1])
  end
  describe '#obstacle?' do
    it "tells if there's an obsatcle between two pieces vertically" do
      board = Board.new
      board.pieces = [
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, :black_king, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, :white_pawn_1, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, :white_rook_1, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, :white_king, nil, nil, nil], 
      ]
      expect(board.obstacle?(:white_rook_1, :black_king)).to eql(true)
    end
    it "tells if there's no obsatcle between two pieces horizontally" do
      board = Board.new
      board.pieces = [
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, :white_rook_1, nil, nil, nil, :black_king, nil], 
        [nil, nil, nil, nil, :white_king, nil, nil, nil], 
      ]
      expect(board.obstacle?(:white_rook_1, :black_king)).to eql(false)
    end
  end

  describe "#in_check?" do
    it "tells if the given board state is in check or not" do
      board = Board.new
      expect(board.in_check?(:black_king)).to be(false)
      board.pieces = [
         [nil, nil, nil, nil, nil, nil, nil, nil], 
         [nil, nil, nil, nil, nil, nil, nil, nil], 
         [nil, nil, :black_king, nil, nil, nil, nil, nil], 
         [nil, nil, nil, nil, nil, nil, nil, nil], 
         [nil, nil, nil, nil, nil, nil, nil, nil], 
         [nil, nil, nil, nil, nil, nil, nil, nil], 
         [nil, nil, :white_rook_1, nil, nil, nil, nil, nil], 
         [nil, nil, nil, nil, :white_king, nil, nil, nil], 
      ]
      expect(board.in_check?(:black_king)).to be(true)
    end
    it "returns false when there's another preventing the in check to happen" do
      board = Board.new
      board.pieces = [
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, :black_king, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, :white_pawn_1, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil, nil, nil], 
        [nil, nil, :white_rook_1, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, :white_king, nil, nil, nil], 
      ]
      expect(board.in_check?(:black_king)).to be(false)
    end
  end


end