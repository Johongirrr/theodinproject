require "./substrings.rb"
 
describe "#substrings" do
  it "returns substrings of one world found in the given dictionary" do
    dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    expect(substrings("below", dictionary)).to eql({ "below" => 1, "low" => 1 })
  end

  it "returns substrings of multi-words" do
    dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    actual = { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }
    expected = substrings("Howdy partner, sit down! How's it going?", dictionary)
    expect(actual).to eql(expected)
  end
end