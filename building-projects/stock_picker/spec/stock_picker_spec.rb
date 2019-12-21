require "./stock_picker.rb"
 
describe "#stock_picker" do
  it "returns the correct stock" do
    days = [17,3,6,9,15,8,6,1,10]
    expect(stock_picker(days)).to eql([1, 4])
    days = [17,6,3,1,15,8,20,1,10]
    expect(stock_picker(days)).to eql([3, 6])
    days = [1,6,3,1,15,8,20,1,17]
    expect(stock_picker(days)).to eql([0, 6])
  end
end