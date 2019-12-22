require './lib/player.rb'

describe Player do
  it "creates player with a name and mark" do
    nasser = Player.new('Nasser', 'O')
    sabah = Player.new('Sabah', 'X')
    expect(nasser.name).to eql('Nasser')
    expect(sabah.name).to eql('Sabah')
    expect(nasser.mark).to eql('O')
    expect(sabah.mark).to eql('X')
  end
end