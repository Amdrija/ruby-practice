class String
  # colorization
  def colorize(code_feedback)
    "\e[#{code_feedback}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end
end

module GameOptions
  NUMBER_OF_GUESSES = 12
  CODE_LENGTH = 4
end

module Gameable
  include GameOptions
  def reset
    @guesses = NUMBER_OF_GUESSES
    generate_code
    play
  end

  private

  def code_feedback(guess_code, computer_evaluating = false)
    computer_feedback = []
    CODE_LENGTH.times do |i|
      if guess_code[i] == @code[i]
        human_feedback = guess_code[i].green
        feedback_color = "green"
      elsif @code.include?(guess_code[i])
        human_feedback = guess_code[i].yellow
        feedback_color = "yellow"
      else
        human_feedback = guess_code[i].red
        feedback_color = "red"
      end
      computer_feedback.push({digit: guess_code[i], feedback_color: feedback_color})
      print human_feedback unless computer_evaluating
    end
    print "\n" unless computer_evaluating
    computer_feedback
  end

  def play_round
    guess_code = ""
    loop do
      puts "Give me a #{CODE_LENGTH}-digit code using nambers 0 to 5." if decoder_game?
      guess_code = self.guess_code

      break if code_valid?(guess_code)
    end

    @last_guess_feedback = code_feedback(guess_code)
    guess_code
  end

  def play
    guess_code = ""
    @guesses.times do 
      guess_code = play_round
      break if won?(guess_code)
      @guesses -= 1
      if decoder_game?
        puts "You have #{@guesses} guesses remaining." 
      else
        puts "Computer has #{@guesses} guesses remaining."
      end
    end

    if won?(guess_code)
      win_message
    else
      loss_message
    end

    puts "Play again? Y/n"
    reset if gets.chomp.upcase == "Y"
  end

  def win_message 
    if decoder_game?
      puts "Congratulations, you broke the code."
    else
      #put out a win message for the computer, because the computer is now 
      #playing our game, and if he won, it means he cracked the player's code,
      #so the player lost
      puts "Unfortunately, the computer has managed to crack your code."
      
    end
  end

  def loss_message
    if decoder_game?
      puts "Unfortunately, you haven't been able to crack the code."
      puts "The code was #{@code}."
    else
      #put out a loss message for the computer, because the computer is now 
      #playing our game, and if he lost, it means he didn't crackthe player's code,
      #so the player won
      puts "Congratulations, your code was too tough for the computer to break."
    end
  end

  def won?(guess_code)
    return @code == guess_code
  end

  def code_valid?(code)
    return false unless code.is_a?(String) && code.length == CODE_LENGTH
    return code.split("").all? {|code| code >= "0" && code <= "5"}
  end

  def decoder_game?
    return self.class == DecoderGame
  end

end

class DecoderGame
  include Gameable

  def initialize
    reset
  end

  def guess_code
    return gets.chomp
  end

  private

  def generate_code
    @code = ""
    CODE_LENGTH.times do
      @code += rand(6).to_s
    end
  end
end

class CoderGame
  include Gameable

  def initialize
    reset
  end

  def guess_code
    remove_impossible_codes
    @all_codes[rand(@all_codes.length)]
  end

  def reset
    reset_last_guess_feedback
    generate_all_codes
    super
  end

  private  

  def reset_last_guess_feedback
    @last_guess_feedback = []
    CODE_LENGTH.times do
      @last_guess_feedback.push({digit: "1", feedback_color: "red"})
    end
  end

  def generate_all_codes
    @all_codes = []
    6.times do |i|
      6.times do |j|
        6.times do |k|
          6.times do |l|
            @all_codes.push("#{i}#{j}#{k}#{l}")
          end
        end
      end
    end
  end

  def remove_impossible_codes
    @all_codes.select! do |code|
      possible_code?(code_feedback(code, true))
    end
  end

  def possible_code?(code_feedback)
    @last_guess_feedback.each_with_index do |digit_hash, i|
      return false if digit_hash[:feedback_color] == "green" && code_feedback[i][:feedback_color] != "green"
    end
    return true
  end

  def generate_code
    puts "Please enter your secret code for the computer to guess."
    loop do
      puts "Give me a #{CODE_LENGTH}-digit code using nambers 0 to 5."
      @code = gets.chomp
      break if code_valid?(@code)
    end
  end
end

class Game
  include GameOptions
  def initialize
    play
  end

  def greeting
    puts "************ Number MasterMind ************"
    puts "*************** Game Rules ****************"
    puts "** As the Codemaker: your goal is to set **"
    puts "** mystery code so cunning that it will ***"
    puts "** keep your opponent guessing for as *****"
    puts "************* long as possible.************"
    puts "*******************************************"
    puts "** As the Decoder: you must break the *****"
    puts "** secret code in the fewest number of ****" 
    puts "**************** guesses. *****************"
    puts "*******************************************"
    puts "*The code contain #{CODE_LENGTH} digits between 0 and 5*"
    puts "********** for example : 1354  ************"
    puts "* if you guessed a number and his position*"
    puts "** the number will upear in green color ***"
    puts "************* like so : #{"1".green} _ _ _ ***********"
    puts "*** if you guest the number but not the ***"
    puts "** position, the number will upear yellow **"
    puts "******* color like so #{"1".green} #{"4".yellow} _ _ *************"
    puts "***** if you guessed the wrong number *****"
    puts "******* the number will upear red *********"
    puts "************ like so : #{"1".green} #{"4".yellow} #{"4".yellow} #{"2".red} ************"
    puts "\n"
  end


  def play
    greeting
    puts "Choose game mode: Decoder (D) or Coder(C)."
    game_mode = gets.chomp.upcase
    while game_mode != "D" && game_mode != "C"
      game_mode = gets.chomp.upcase
    end

    if game_mode == "D"
      if @decoder.nil?
        @decoder = DecoderGame.new
      else
        @decoder.reset
      end
    else
      if @coder.nil?
        @coder = CoderGame.new
      else
        @coder.reset
      end
    end

    puts "Choose different mode? Y/n"
    again = gets.chomp.upcase
    if again == "Y"
      play
    end
  end


end

Game.new
