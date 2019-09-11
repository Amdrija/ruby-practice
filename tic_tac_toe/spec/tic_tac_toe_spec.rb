require './tic_tac_toe.rb'

RSpec.describe Board do
  describe ".field_number_to_grid(field_number)" do
    it "Returns the coordinates of the field given the field number" do
      expect(Board.field_number_to_grid(5)).to eql([1, 1])
    end
    it "Returns the coordinates of the field given the field number" do
      expect(Board.field_number_to_grid(7)).to eql([2, 0])
    end
  end

  describe ".field_valid?(field_number_string)" do
    it "Returns true if field_number_string is a digit from 1 to 9" do
      expect(Board.field_valid?("5")).to eql(true)
    end
    it "Returns true if field_number_string is a digit from 1 to 9" do
      expect(Board.field_valid?("9")).to eql(true)
    end
    it "Returns true if field_number_string is a digit from 1 to 9" do
      expect(Board.field_valid?("1")).to eql(true)
    end
    it "Returns true if field_number_string is a digit from 1 to 9" do
      expect(Board.field_valid?("0")).to eql(false)
    end
    it "Returns true if field_number_string is a digit from 1 to 9" do
      expect(Board.field_valid?("10")).to eql(false)
    end
    it "Returns true if field_number_string is a digit from 1 to 9" do
      expect(Board.field_valid?("z")).to eql(false)
    end
  end

  describe "#winner" do
    it "Returns X if player X won by marking horizontally" do
      board = Board.new
      board.mark_field("1", "X")
      board.mark_field("2", "X")
      board.mark_field("3", "X")
      expect(board.winner).to eql("X")
    end

    it "Returns X if player X won by marking vertically" do
      board = Board.new
      board.mark_field("1", "X")
      board.mark_field("4", "X")
      board.mark_field("7", "X")
      expect(board.winner).to eql("X")
    end

    it "Returns X if player X won by marking diagonally" do
      board = Board.new
      board.mark_field("1", "X")
      board.mark_field("5", "X")
      board.mark_field("9", "X")
      expect(board.winner).to eql("X")
    end

    it "Returns X if player X won by marking diagonally" do
      board = Board.new
      board.mark_field("3", "X")
      board.mark_field("5", "X")
      board.mark_field("7", "X")
      expect(board.winner).to eql("X")
    end

    it "Returns false if the board is empty" do
      board = Board.new
      expect(board.winner).to eql(false)
    end
  end
end
