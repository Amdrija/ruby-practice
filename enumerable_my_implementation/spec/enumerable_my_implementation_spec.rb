require './enumerable_my_implementation.rb'
require 'rspec'

RSpec.describe Enumerable do
  describe "#my_all?" do
    it "Returns true if all the items in the array are positive" do
      expect([1,2,3].my_all? {|el| el > 0}).to eql(true)
    end

    it "Returns true if all the items in the array are positive" do
      expect([1,2,3, -1].my_all? {|el| el > 0}).to eql(false)
    end

    it "Returns true if all the items in the array are truthy" do
      expect([1,2,3].my_all?).to eql(true)
    end

    it "Returns true if all the items in the array are truthy" do
      expect([1,2,nil].my_all?).to eql(false)
    end
  end
end