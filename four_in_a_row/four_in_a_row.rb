class Board
  @@blank_char = "_"

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

class Player
  attr_accessor :name, :mark
  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

class Game
  TURNS = 6 * 7
  def initialize
    set_player_names
    reset
  end

  def reset
    @turns_left = TURNS
    if @board.nil?
      @board = Board.new
    else
      @board.reset
    end
    play
  end

  private
  def play
    winner_mark = false
    display_board
    until winner_mark || @turns_left == 0 
      if @turns_left % 2 == 0
        winner_mark = play_turn(@player_x)
      else
        winner_mark = play_turn(@player_o)
      end
      @turns_left -= 1
    end

    if winner_mark
      winner = winner_mark == "X" ? @player_x : @player_o
      winning_message(winner)
    else
      draw_message
    end

    if play_again?
      reset
    end
  end

  private

  def play_again?
    puts "Do you want to play again? Y/n"
    return gets.chomp.upcase == "Y"
  end

  def winning_message(winner)

    puts "Congratulations #{winner.name}, you won."
  end

  def draw
    puts "It's a draw"
  end

  def play_turn(player)
    
    puts "#{player.name}, choose a column."
    column = ""
    loop do
      column = gets.chomp
      break if column_valid?(column)
    end
    @board.mark_board(player.mark, column.to_i)
    display_board
    @board.check_winner
  end
  def display_board
    puts @board
    puts "-------"
    puts "0123456"
  end

  
  def set_player_names
    @player_x = Player.new("","X")
    @player_o = Player.new("","O")
    puts "Player 1, what's your name?"
    @player_x.name = gets.chomp

    puts "Player 2, what's your name?"
    @player_o.name = gets.chomp
  end

  def column_valid?(column)
    column.length == 1 && column >= "0" && column <= "6"
  end
end

Game.new
