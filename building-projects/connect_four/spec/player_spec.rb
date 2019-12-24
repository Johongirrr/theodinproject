require './lib/player.rb'

describe Player do
  it "creates a player with name and a piece symbol" do
    player1 = Player.new('Nasser', '♈')
    player2 = Player.new('Sabah', '♎')
    expect(player1).not_to be(nil)
    expect(player2).not_to be(nil)
    expect(player1.name).to eql('Nasser')
    expect(player2.name).to eql('Sabah')
  end
end