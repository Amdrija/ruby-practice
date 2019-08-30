class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
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

module Gameable
  private
  def reset
    generate_code
    play
  end

  def color_code(guess_code)
    4.times do |i|
      if guess_code[i] == @code[i]
        print guess_code[i].green
      elsif @code.include?(guess_code[i])
        print guess_code[i].yellow
      else
        print guess_code[i].red
      end
    end
    print "\n"
  end

  def play_round
    guess_code = ""
    loop do
      puts "Give me a 4-digit code using nambers 0 to 5." if self.class == DecoderGame
      guess_code = self.guess_code

      break if code_valid?(guess_code)
    end

    color_code(guess_code)
    guess_code
  end

  def play
    guess_code = ""
    @rounds.times do 
      guess_code = play_round
      break if won?(guess_code)
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
    puts "Congratulations, you broke the code."
  end

  def loss_message
    puts "Unfortunately, you haven't been able to crack the code."
  end

  def won?(guess_code)
    return @code == guess_code
  end

  def code_valid?(code)
    return false unless code.is_a?(String) && code.length == 4
    return code.split("").all? {|code| code >= "0" && code <= "5"}
  end

end

class DecoderGame
  include Gameable
  
  def initialize
    @rounds = 1
    reset
  end

  def guess_code
    
    return gets.chomp
  end

  private

  def generate_code
    @code = ""
    4.times do
      @code += rand(6).to_s
    end
  end
end

class Game
  def initialize
    reset
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
    puts "*The code contain 4 digits between 0 and 5*"
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

  def reset
    greeting
  end

end


DecoderGame.new




