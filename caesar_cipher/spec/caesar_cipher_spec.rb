require './caesar_cipher.rb'

describe "#caesar_cipher" do
  it "returns encrypted string by shifting it by a given number" do
    expect(caesar_cipher("andrija", 1)).to eql("boesjkb")
  end
end