class Mastermind

	def initialize()
	secret_code = Array.new(4) { rand(0..9) }
    #secret_code = [1, 1, 8, 9]
    @num_guesses = 12
    introduction
	end

  def introduction
    introduction_message
    introduction_choose_path
  end

	def introduction_message
		puts "Welcome to Mastermind."
		puts "This game consists of a Mastermind and a Player."
    puts "Do you want to be the Mastermind or the Player? (Enter 'mastermind' or 'player')"
		puts " "
  end

  def introduction_choose_path
		input = gets.chomp.downcase
    
        if input == "mastermind"
        play_as_mastermind
        elsif input == "player"
        play_as_player
        else
        puts "You must enter 'mastermind' or 'player'."
        introduction_choose_path
        end
	end

	def print_mastermind_instructions
		puts " "
		puts "Welcome Mastermind!"
		puts " "
		puts "In this game, the computer has 12 tries to guess a four-digit secret code."
		puts " "
		puts "Please define your four-digit secret code now."
		puts " "
		# the below makes the input into an array of integers
		@mastermind_code = [1,2,3,4]
		puts " "
		puts "Your code has been defined as #{@mastermind_code}"
		puts " "
		puts "Let the guessing begin!"
		puts " "
	end

  def play_as_player
    print_player_instructions
    check_player_guesses
  end

  def play_as_mastermind
    print_mastermind_instructions
    check_mastermind_guesses
  end

	def print_player_instructions
		puts " "
		puts "Welcome Player!"
		puts " "
		puts "In this game, you have 12 tries to guess a four-digit secret code."
		puts "The code consists of four digits."
		puts "If you guess a number that is in the code in the right position"
		puts "or if you guess a number in the code that's in the wrong position, we'll let you know."
		puts " "
	end

  def check_player_guesses
    p secret_code

		while @num_guesses >= 1
			print_remaining_guesses
            player_guess = parse_player_input

      if player_guess == secret_code
        puts "You win!"
				puts "You took #{@num_guesses} guesses to solve the problem."
				return
      else
        generate_feedback(player_guess)
        # maybe other stuff
      end

      @num_guesses -= 1
    end
		puts "There are no more turns."
		puts " "
		puts "You lose."
		puts " "
		puts "Game over."
    # logic for if the loop ends, AKA 0 turns left, goes here
  end

  def print_remaining_guesses
  	if @num_guesses == 1
			puts "Please enter your guess now. You have #{@num_guesses} guess remaining."
		else
			puts "Please enter your guess now. You have #{@num_guesses} guesses remaining."
		end
  end

  def parse_player_input
		guess_arr = gets.chomp.split('')
        guess_arr = guess_arr.map(&:to_i)
  end

  def generate_feedback(guess_arr)
    # this returns # of matching numbers regardless of position
    numbers_in_common = guess_arr & secret_code
    # this compares array positions to find items in correct positions
    numbers_in_right_position = secret_code.zip(guess_arr).count {|a,b| a == b}
    # subtracts the "correct position". Check the logic another time
     wrong_position = numbers_in_common.length - numbers_in_right_position
    print_feedback(numbers_in_common, numbers_in_right_position)
  end

  def generate_computer_feedback(guess)
    # this returns # of matching numbers regardless of position
    numbers_in_common = guess & @mastermind_code
    # this compares array positions to find items in correct positions
    @numbers_in_right_position = @mastermind_code.zip(guess).count {|a, b| a == b }
    #subtracts the "correct position". Check the logic another time
    wrong_position = numbers_in_common.length - @numbers_in_right_position.length
    print_feedback(numbers_in_common, @numbers_in_right_position)
  end

  def print_feedback(num_in_common, num_in_position)
    puts "You have #{num_in_common.length} number(s) in the wrong position."
    puts "You have #{num_in_position} number(s) in the right position"
		puts " "
  end

# Use Five-Guess algorithm to solve
    def check_mastermind_guesses
        p @mastermind_code
    
        while @num_guesses >= 1
            print_remaining_guesses

            # step one: create a set of 1296 possibilities
            guess_pool = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
            # => "[1234]"

            # first guess is ALWAYS 1122
            if @num_guesses == 12
              guess = [1, 1, 2, 2]
              # => "[1, 1, 2, 2]
              # subsequent guesses are random
            else
              guess = guess_pool
              # only return the value if
              if generate_computer_feedback(guess) == generate_computer_feedback(1122)
              else
                guess
              end
            end

            # IF GUESS IS CORRECT
            if guess == @mastermind_code.to_s
                puts "Computer wins!"
                puts "Computer took #{@num_guesses} guesses to solve the problem."
                return
            # IF GUESS IS INCORRECT
            else
                puts "The computer guessed #{guess}."
                puts ""
                generate_computer_feedback(guess)
                puts ""
                puts "Press enter to guess again."
                continue = gets.chomp
                
                @num_guesses -= 1

                # loop through all of guess pool
        end
    end
    puts "There are no more turns."
    puts " "
    puts "You win!"
    puts " "
    puts "Game over."
# logic for if the loop ends, AKA 0 turns left, goes here
    end

    def computer_guesses
    end

## Delete this method and replace 'code' with secret_code
	# private

	# def code
	# 	return secret_code
	# end

end

# Below, new_game calls the initialize method
new_game = Mastermind.new()