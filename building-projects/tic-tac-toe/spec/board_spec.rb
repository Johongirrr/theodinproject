require './lib/board.rb'

describe Board do
  
  it "returns the winner's mark" do
    board = Board.new
    board.marks = {
      0 => 'X', 1 => 'O', 2 => 'O',
      3 => nil, 4 => 'X', 5 => 'O',
      6 => nil, 7 => nil, 8 => 'X'
    }
    expect(board.is_there_a_winner?).to eql('X')
  end

  it "returns true as to indicate the game is over with a draw" do
    board = Board.new
    board.marks = {
      0 => 'X', 1 => 'O', 2 => 'O',
      3 => 'O', 4 => 'X', 5 => 'X',
      6 => 'X', 7 => 'O', 8 => 'O'
    }
    expect(board.end_with_draw?).to eql(true)
  end

  it "tells if the game is over or not" do
    board = Board.new
    board.marks = {
      0 => 'X', 1 => 'O', 2 => 'O',
      3 => 'O', 4 => nil, 5 => 'X',
      6 => 'X', 7 => 'O', 8 => 'O'
    }
    expect(board.is_over?).to eql(false)
    board.add(4, 'O')
    expect(board.is_over?).to eql(true)
  end
  
  it "add marker to the board" do
    board = Board.new
    expect(board.marks[0]).to eql(nil)
    expect( board.add(0, 'X')).to eql(true)
    expect(board.marks[0]).to eql('X')
  end

  it "returns false when trying to add marker in already filled index" do
    board = Board.new
    board.marks[0] = 'X'
    expect(board.add(0, 'O')).to eql(false)
  end

  it "returns false when trying to access an invalid index" do
    board = Board.new
    expect(board.add(99999, 'O')).to eql(false)
    expect(board.add(-5, 'O')).to eql(false)
  end

  it "returns whatever the board is empty" do
    board = Board.new
    expect(board.is_empty?(0)).to eql(true)
    board.marks[0] = 'X'
    expect(board.is_empty?(0)).to eql(false)
  end
end