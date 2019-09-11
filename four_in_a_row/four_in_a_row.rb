class Board
  @@blank_char = "-"

  def self.blank_char
    @@blank_char
  end

  def initialize
    reset
  end

  def reset
    @board = []
    6.times do
      row = []
      7.times do
        row.push(@@blank_char)
      end
      @board.push(row)
    end
  end

  def to_s
    string = ""
    @board.each do |row|
      row.each do |cell|
        string += cell
      end
      string += "\n"
    end
    string
  end

  def mark_board(mark, column)
    5.downto(0) do |i|
      if @board[i][column] == @@blank_char
        return @board[i][column] = mark
      end
    end
    false
  end

  def check_winner
    #check rows for the winner
    6.times do |i|
      same_count = 1
      6.times do |j|
        if @board[i][j] != @@blank_char && @board[i][j] == @board[i][j + 1]
          same_count += 1
        else
          same_count = 1
        end

        return @board[i][j] if same_count == 4
      end
    end


    #checks columns for the winner
    7.times do |i|
      same_count = 1
      5.times do |j|
        if @board[j][i] != @@blank_char && @board[j][i] == @board[j + 1][i]
          same_count += 1
        else
          same_count = 1
        end

        return @board[j][i] if same_count == 4
      end
    end

    
    #check the 4-cell-long left diagonal
    same_count = 1
    3.times do |i|
      if @board[i + 2][i] != @@blank_char && @board[i + 2][i] == @board[i + 3][i + 1]
        same_count += 1
      else
        same_count = 1
      end

      return @board[i + 2][i] if same_count == 4
    end

    
    #check the 5-cell-long left diagonal
    same_count = 1
    4.times do |i|
      if @board[i + 1][i] != @@blank_char && @board[i + 1][i] == @board[i + 2][i + 1]
        same_count += 1
      else
        same_count = 1
      end

      return @board[i + 1][i] if same_count == 4
    end

    
    #check 6-cell-long left diagonal
    same_count = 1
    5.times do |i|
      if @board[i][i] != @@blank_char && @board[i][i] == @board[i + 1][i + 1]
        same_count += 1
      else
        same_count = 1
      end

      return @board[i][i] if same_count == 4
    end

    
    #check 6-cell-long right diagonal
    same_count = 1
    5.times do |i|
      if @board[i][i + 1] != @@blank_char && @board[i][i + 1] == @board[i + 1][i + 2]
        same_count += 1
      else
        same_count = 1
      end

      return @board[i][i + 1] if same_count == 4
    end

    
    #check 5-cell-long right diagonal
    same_count = 1
    4.times do |i|
      if @board[i][i + 2] != @@blank_char && @board[i][i + 2] == @board[i + 1][i + 3]
        same_count += 1
      else
        same_count = 1
      end

      return @board[i][i + 2] if same_count == 4
    end

    #check 4-cell-long right diagonal
    same_count = 1
    3.times do |i|
      if @board[i][i + 3] != @@blank_char && @board[i][i + 3] == @board[i + 1][i + 4]
        same_count += 1
      else
        same_count = 1
      end

      return @board[i][i + 3] if same_count == 4
    end

    #* REVERSE DIAGONALS

    #check 4-cell-long left reverse diagonal
    same_count = 1
    3.times do |i|
      if @board[3 - i][i] != @@blank_char && @board[3 - i][i] == @board[2 - i][i + 1]
        same_count += 1
      else
        same_count = 1
      end

      return @board[3 - i][i] if same_count == 4
    end

    #check 5-cell-long left reverse diagonal
    same_count = 1
    4.times do |i|
      if @board[4 - i][i] != @@blank_char && @board[4 - i][i] == @board[3 - i][i + 1]
        same_count += 1
      else
        same_count = 1
      end

      return @board[4 - i][i] if same_count == 4
    end
    
    #check 6-cell-long left reverse diagonal
    same_count = 1
    5.times do |i|
      if @board[5 - i][i] != @@blank_char && @board[5 - i][i] == @board[4 - i ][i + 1]
        same_count += 1
      else
        same_count = 1
      end

      return @board[5 - i][i] if same_count == 4
    end

    #check 6-cell-long right reverse diagonal
    same_count = 1
    5.times do |i|
      if @board[5 - i][i + 1] != @@blank_char && @board[5 - i][i + 1] == @board[4 - i ][i + 2]
        same_count += 1
      else
        same_count = 1
      end

      return @board[5 - i][i + 1] if same_count == 4
    end

    #check 5-cell-long right reverse diagonal
    same_count = 1
    4.times do |i|
      if @board[5 - i][i + 2] != @@blank_char && @board[5 - i][i + 2] == @board[4 - i ][i + 3]
        same_count += 1
      else
        same_count = 1
      end

      return @board[5 - i][i + 2] if same_count == 4
    end

     #check 4-cell-long right reverse diagonal
     same_count = 1
     3.times do |i|
       if @board[5 - i][i + 3] != @@blank_char && @board[5 - i][i + 3] == @board[4 - i ][i + 4]
         same_count += 1
       else
         same_count = 1
       end
 
       return @board[5 - i][i + 3] if same_count == 4
     end

    false
  end

  #*END OF #check_winner

  
end
