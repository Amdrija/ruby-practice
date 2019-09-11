require './caesar_cipher.rb'
require 'rspec'

RSpec.describe "#caesar_cipher" do
  it "returns encrypted string by shifting it by 1 to the right" do
    expect(caesar_cipher("andrija", 1)).to eql("boesjkb")
  end
  
  it "returns encrypted string by shifting it by -1 to the right" do
    expect(caesar_cipher("andrija", -1)).to eql("zmcqhiz")
  end

  it "returns encrypted string by shifting it by 27 to the right" do
    expect(caesar_cipher("andrija", 27)).to eql("boesjkb")
  end
end