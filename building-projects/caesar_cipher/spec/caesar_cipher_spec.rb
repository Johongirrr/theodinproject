require "./caesar_cipher.rb"
 
describe "#caesar_cipher" do
  it "returns case with 5 steps" do
    expect(caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
  end
  
  it "returns case with 7 steps" do
    expect(caesar_cipher("Hello what @ is *-/ kaka MAMA pdof", 7)).to eql("Olssv doha @ pz *-/ rhrh THTH wkvm")
  end

  it "returns case with 13 steps" do
    expect(caesar_cipher("Nasser Abachi", 13)).to eql("Anffre Nonpuv")
  end
end