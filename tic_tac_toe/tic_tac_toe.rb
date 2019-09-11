class Board
  def self.field_number_to_grid(field_number)
    field_number -= 1
    [field_number / 3, field_number % 3]
  end

  def self.field_valid?(field_number_string)
    return field_number_string.length == 1 && field_number_string >= "1" && field_number_string <= "9"
  end

  def initialize
    reset
  end

  def reset
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def to_s
    return  " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}\n" +
            "---+---+---\n" + 
            " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}\n" +
            "---+---+---\n" +
            " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}\n"
  end

  def mark_field(field_number, mark)
    if !Board.field_valid?(field_number) || field_marked?(field_number.to_i)
      puts "Not a valid field."
    end
    field_number = field_number.to_i

    i, j = *Board.field_number_to_grid(field_number)
    @board[i][j] = mark
  end

  #returns X or O if X or O won, respectively
  #returns false if there isn't a winner
  def winner
    3.times do |i|
      return @board[i][0] if @board[i][0] == @board[i][1] && @board[i][1] == @board[i][2]
    end

    3.times do |i|
      return @board[0][i] if @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i]
    end

    return @board[0][0] if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]

    return @board[0][2] if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
    
    false
  end

  def field_marked?(field_number)
    i, j = *Board.field_number_to_grid(field_number)
    return @board[i][j] == "X" || @board[i][j] == "O"
  end
end

#*****************
# Player class

class Player
  attr_accessor :name
  attr_accessor :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

#************************
# Game class

class Game
  def initialize
    set_players
    reset
  end
  
  def greeting
    puts "######### Tic Tac Toe ##########"
    puts "#########  Game Rules  #########"
    puts "## two players, X and O, who  ##"
    puts "##  take turns marking the    ##"
    puts "## spaces in a 3×3 grid. The  ##"
    puts "##  player who succeeds in    ##"
    puts "##   placing three of their   ##"
    puts "##    marks in a horizontal,  ##"
    puts "## vertical, or diagonal row  ##"
    puts "##      wins the game.        ##"
    puts "################################"
  end

  def set_player_marks
    mark = ""
    loop do
      puts "#{@player_x.name}, choose X or O.\n"
      mark = gets.chomp.upcase
      break if mark == "X" || mark == "O"
    end

    @player_x.mark = mark
    @player_o.mark = mark == "X" ? "O" : "X"
    if @player_x.mark == "O"
      @player_x, @player_o = @player_o, @player_x
    end
  end

  def set_players
    puts "Player 1, type your name.\n"
    player1_name = gets.chomp
    puts "Player 2, type your name.\n"
    player2_name = gets.chomp

    @player_x = Player.new(player1_name, nil)
    @player_o = Player.new(player2_name, nil)
  end


  def reset
    greeting
    set_player_marks
    @turn = 1
    @board = Board.new
    play
  end

  def play
    loop do
      play_round
      break if @turn >= 9 || winner
      @turn += 1
    end

    winning_mark = winner
    if winning_mark
      winning_message(winning_mark)
    else
      draw_message
    end
    reset if play_again?
  end

  def play_again?
    puts "Do you want to play again? Y/n"
    return gets.chomp.upcase == "Y"
  end


  def player_play_round(player)
    puts "#{player.name} plays.\n"
    field_number = ""
    loop do
      puts "Choose a field number between 1 and 9 that hasn't been marked yet.\n"
      field_number = gets.chomp
      
      break if Board.field_valid?(field_number) && !@board.field_marked?(field_number.to_i)
    end

    @board.mark_field(field_number, player.mark)
  end

  def play_round
    puts "\n\n"
    puts @board
    if @turn % 2 == 1
      player_play_round(@player_x)
    else
      player_play_round(@player_o)
    end
  end

  def winner
    return @board.winner
  end

  def winning_message(winning_mark)
    winner = winning_mark == "X" ? @player_x.name : @player_o.name
    puts "Congratulations #{winner}, you have won."
  end

  def draw_message
    puts "It's a draw."
  end
end

if __FILE__ == $0
  Game.new
end
