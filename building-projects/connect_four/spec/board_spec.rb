require './lib/board.rb'

describe Board do
  it "returns Array as board" do
    board = Board.new
    expect(board.pieces.class).to eql(Array)
    expect(board.pieces.length).to eql(6) #rows
    expect(board.pieces[0].length).to eql(7) #columns
    expect(board.pieces[4][3]).to eql(nil)
  end
  describe "#add" do
    it "add piece to the board" do
      board = Board.new
      expect(board.pieces[4][4]).to be(nil)
      expect(board.pieces[4][5]).to be(nil)
      board.add(4, 'O')
      board.add(4, 'O')
      expect(board.pieces[4][4]).to eql('O')
      expect(board.pieces[5][4]).to eql('O')
    end

    it "should not add a piece in full column" do
      board = Board.new
      0.upto(6) {board.add(3, 'O')}
      expect(board.pieces[0][3]).to eql('O')
      expect(board.pieces[1][3]).to eql('O')
      expect(board.pieces[2][3]).to eql('O')
      expect(board.pieces[3][3]).to eql('O')
      expect(board.pieces[4][3]).to eql('O')
      expect(board.pieces[5][3]).to eql('O')
      expect(board.add(3, 'X')).to be(false)
    end
  end
  it "returns true if the board is full" do
    board = Board.new
    expect(board.full?).to be(false)
    0.upto(5){0.upto(6){|i| board.add(i, i%2==0? 'O': 'X')}}
    expect(board.full?).to be(true)
  end

  describe "#winner?"do
    it "returns true for horizontal connected pieces" do
      board = Board.new
      expect(board.winner?).to be(false)
      board.add(3, 'X')
      board.add(4, 'X')
      board.add(5, 'X')
      board.add(6, 'X')
      expect(board.winner?).to eql('X')
    end

    it "returns true for vertical connected pieces" do
      board = Board.new
      expect(board.winner?).to be(false)
      board.add(3, 'X')
      board.add(3, 'X')
      board.add(3, 'X')
      board.add(3, 'X')
      expect(board.winner?).to eql('X')
    end

    it "return true for right diagonal connected pieces" do
      board = Board.new
      expect(board.winner?).to be(false)
      board.add(3, 'X')
      board.add(4, 'O')
      board.add(4, 'X')
      board.add(5, 'O')
      board.add(5, 'O')
      board.add(5, 'X')
      board.add(6, 'O')
      board.add(6, 'O')
      board.add(6, 'O')
      board.add(6, 'X')
      expect(board.winner?).to eql('X')
    end
    it "return true for left diagonal connected pieces" do
      board = Board.new
      expect(board.winner?).to be(false)
      board.add(0, 'O')
      board.add(0, 'O')
      board.add(0, 'O')
      board.add(0, 'X')
      board.add(1, 'O')
      board.add(1, 'O')
      board.add(1, 'X')
      board.add(2, 'O')
      board.add(2, 'X')
      board.add(3, 'X')
      expect(board.winner?).to eql('X')
    end
  end
end