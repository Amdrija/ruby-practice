require "./four_in_a_row.rb"

RSpec.describe Board do
  describe "#reset" do
    it "Resets the board with blank characters" do
      board = Board.new
      board.reset
      expect(board.to_s).to eql("#{Board.blank_char * 7}\n" * 6)
    end
  end

  describe "#mark_board(mark, column)" do
    it "Adds the mark to the top of the given column" do
      board = Board.new
      board.mark_board("X", 5)
      expect(board.to_s).to eql("#{Board.blank_char * 7}\n" * 5 + "#{Board.blank_char * 5}X#{Board.blank_char}\n")
    end

    it "Adds the mark to the top of the given column" do
      board = Board.new
      board.mark_board("X", 5)
      board.mark_board("X", 5)
      expect(board.to_s).to eql("#{Board.blank_char * 7}\n" * 4 + "#{Board.blank_char * 5}X#{Board.blank_char}\n" * 2)
    end
    it "Adds the mark to the top of the given column" do
      board = Board.new
      6.times do
        board.mark_board("X", 5)
      end
      expect(board.to_s).to eql("#{Board.blank_char * 5}X#{Board.blank_char}\n" * 6)
    end

    it "Returns false if the column is full" do
      board = Board.new
      6.times do
        board.mark_board("X", 5)
      end
      expect(board.mark_board("X", 5)).to eql(false)
    end
  end

  describe "#check_winner" do
    it "Returns X if there are 4 X's in a row" do
      board = Board.new
      4.times do |i|
        board.mark_board("X", i + 1)
      end
      expect(board.check_winner).to eql("X")
    end

    it "Returns X if there are 4 X's in a column" do
      board = Board.new
      4.times do |i|
        board.mark_board("X", 5)
      end
      expect(board.check_winner).to eql("X")
    end

    it "Returns X if there are 4 X's in a 4-cell-long left diagonal" do
      board = Board.new
      4.times do |i|
        (3 - i).times do
          board.mark_board("O", i)
        end
        board.mark_board("X", i)
      end
      
      expect(board.check_winner).to eql("X")
    end

    it "Returns X if there are 4 X's in a 5-cell-long left diagonal" do
      board = Board.new
      4.times do |i|
        (3 - i).times do
          board.mark_board("O", i + 1)
        end
        board.mark_board("X", i + 1)
      end

      expect(board.check_winner).to eql("X")
    end

    it "Returns X if there are 4 X's in a 6-cell-long left diagonal" do
      board = Board.new
      4.times do |i|
        (3 - i).times do
          board.mark_board("O", i + 2)
        end
        board.mark_board("X", i + 2)
      end
      
      expect(board.check_winner).to eql("X")
    end

    it "Returns X if there are 4 X's in a 6-cell-long right diagonal" do
      board = Board.new
      4.times do |i|
        (3 - i).times do
          board.mark_board("O", i + 3)
        end
        board.mark_board("X", i + 3)
      end
      
      expect(board.check_winner).to eql("X")
    end

    it "Returns X if there are 4 X's in a 5-cell-long right diagonal" do
      board = Board.new
      4.times do |i|
        i % 3 == 0 ? board.mark_board("X", i + 3) : board.mark_board("O", i + 3)
        (3 - i).times do
          board.mark_board("O", i + 3)
        end
        board.mark_board("X", i + 3)
      end
      expect(board.check_winner).to eql("X")
    end

    it "Returns X if there are 4 X's in a 4-cell-long right diagonal" do
      board = Board.new
      4.times do |i|
        i % 3 == 2 ? board.mark_board("O", i + 3) : board.mark_board("X", i + 3)
        i % 3 == 1 ? board.mark_board("O", i + 3) : board.mark_board("X", i + 3)
        (3 - i).times do
          board.mark_board("O", i + 3)
        end
        board.mark_board("X", i + 3)
      end
      expect(board.check_winner).to eql("X")
    end

    #* REVERSE DIAGONALS
    it "Returns X if there are 4 X's in a 4-cell-long left reverse diagonal" do
      board = Board.new
      4.times do |i|
        i % 4 == 1 ? board.mark_board("O", i) : board.mark_board("X", i)
        i % 4 == 1 ? board.mark_board("O", i) : board.mark_board("X", i)
        i.times do
          board.mark_board("O", i)
        end
        board.mark_board("X", i)
      end
      
      expect(board.check_winner).to eql("X")
    end

    it "Returns X if there are 4 X's in a 5-cell-long left reverse diagonal" do
      board = Board.new
      4.times do |i|
        i % 4 == 1 ? board.mark_board("O", i) : board.mark_board("X", i)
        i.times do
          board.mark_board("O", i)
        end
        board.mark_board("X", i)
      end
      
      expect(board.check_winner).to eql("X")
    end

    it "Returns X if there are 4 X's in a 6-cell-long left reverse diagonal" do
      board = Board.new
      4.times do |i|
        i.times do
          board.mark_board("O", i)
        end
        board.mark_board("X", i)
      end

      expect(board.check_winner).to eql("X")
    end

    it "Returns X if there are 4 X's in a 6-cell-long right reverse diagonal" do
      board = Board.new
      4.times do |i|
        i.times do
          board.mark_board("O", i + 1)
        end
        board.mark_board("X", i + 1)
      end

      expect(board.check_winner).to eql("X")
    end

    it "Returns X if there are 4 X's in a 5-cell-long right reverse diagonal" do
      board = Board.new
      4.times do |i|
        i.times do
          board.mark_board("O", i + 2)
        end
        board.mark_board("X", i + 2)
      end

      expect(board.check_winner).to eql("X")
    end

    it "Returns X if there are 4 X's in a 4-cell-long right reverse diagonal" do
      board = Board.new
      4.times do |i|
        i.times do
          board.mark_board("O", i + 3)
        end
        board.mark_board("X", i + 3)
      end
      expect(board.check_winner).to eql("X")
    end
  end

  #* END OF #check_winner TESTS
end

describe Game do
  
end