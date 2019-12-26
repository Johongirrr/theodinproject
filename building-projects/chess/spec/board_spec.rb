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
end