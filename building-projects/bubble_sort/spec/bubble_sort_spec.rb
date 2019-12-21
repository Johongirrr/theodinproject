require "./bubble_sort.rb"
 
describe "#bubble_sort" do
  it "returns sorted array in ascendant way" do
    expect(bubble_sort([4,3,78,2,0,2])).to eql([0,2,2,3,4,78])
    expect(bubble_sort([5, 3, 1, 4, 2])).to eql([1, 2, 3, 4, 5])
  end
end
describe "#bubble_sort_by" do
  it "accepts a block" do
    expected = bubble_sort_by(["hi","hello","hey"]){|left,right| left.length - right.length}
    expect(expected).to eql(["hi", "hey", "hello"])
  end
end