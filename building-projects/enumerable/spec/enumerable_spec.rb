require "./enumerable.rb"
include Enumerable

describe "#my_each*" do
  it "returns the multiples of the given numbers" do
    expect(my_each([1, 2, 3]){|n| n*2}).to eql([2, 4, 6])
  end
  it "returns multiple of each number plus his index" do
    expect(my_each_with_index([1, 2, 3]){|n, i| n*2+i}).to eql([2, 5, 8])
  end
end
describe "Known Enumerable Methods" do
  it "return only values that matche the condition" do
    expected = my_select([1, 2, 3, 4, 5, 6, 7, 8, 9]){|n| n % 2 == 0 }
    expect(expected).to eql([2, 4, 6, 8])
  end
  it "return each value incremented by 1" do
    expect(my_map([1, 2, 3, 4]){|n| n + 1 }).to eql([2, 3, 4, 5])
  end
  it "returns true if any value is even" do
    expect(my_any?([1, 2, 3, 4]){|n| n % 2 == 0 }).to eql(true)
  end
  it "returns true if all the values are even" do
    expect(my_all?([1, 2, 3, 4]){|n| n % 2 == 0 }).to eql(false)
    expect(my_all?([2, 4, 6]){|n| n % 2 == 0 }).to eql(true)
  end
  it "returns none because all the values are odd" do
    expect( my_none?([1, 2, 3, 4]){|n| n % 2 == 0 }).to eql(false)
    expect(my_none?([1, 3, 7]){|n| n % 2 == 0 }).to eql(true)
  end
  it "returns the sum of an array" do
    expect(my_inject?([1, 2, 3, 4], 0){|total, n| n + total  }).to eql(10)
  end
end