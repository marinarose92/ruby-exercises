require 'yaml'

class Hangman

    @@dictionary = File.read("5desk.txt")

    @@dict_arr = @@dictionary.split()
    # this is an array of only words between 5-12 letters
    @@right_length = @@dict_arr.select do |i| 
        if i.length >= 5 && i.length <= 12
            i
        end
    end

    @@word = @@right_length.sample.downcase
    
    def initialize
        @blank_spaces_arr = []
        @blank_spaces_arr.fill("_", @blank_spaces_arr.size, @@word.length)
        @wrong_answers = 0
        introduction
        options_display
        options_logic 
        options_display
        hangman_body
        player_guess
        playing_board
	end

	def introduction
        puts "======================================================"
        puts ""
        puts "W E L C O M E".rjust(36)
        puts ""
        puts "T O".rjust(30)
        puts ""
        puts "H A N G M A N".rjust(36)
        puts ""
        puts "======================================================"
        puts ""
    end
    
    def options_display
        puts "1. New Game"
        puts "2. Load Game"
        puts "3. Rules"
        puts "4. Save"
        puts "5. Exit to Main Menu"
        puts " "
        puts "Type 'OPTIONS' for options."
        puts " "
        input = gets.chomp
        puts " "
        options_logic(input)
    end

    def new_game
        puts " "
        puts "======================================================"
        puts "N E W  G A M E  B E G I N".rjust(36)
        puts "======================================================"
        puts " "
        hangman_body
        player_guess
        playing_board
    end

    def exit                
        puts ""
        puts "Exiting game . . ."
        puts ""
        Hangman.new
    end

    def options_logic(input)
        if input == "options"
            options
        elsif input == "1"
            new_game
        elsif input == "2"
            load_game(save_game)
        elsif input == "3"
            rules
        elsif input == "4"
            save_game
        elsif input == "5"
            exit
            options_logic(input)
        else
            puts "Please select a valid option above."
        end
    end

    def rules
        puts "======================================================"
        puts "R U L E S".rjust(36)
        puts "======================================================"
        puts " "
        puts "1. The computer will select a word from its dictionary"
        # the word is between 5 and 12 characters
        puts "2. You have 6 guesses to guess the word."
        puts " "
        hangman_body
        player_guess
        playing_board
	end

	def hangman_body
        gallows = "   ----"
        head = "   O  |"
        empty = "      |"
        body = "   |  |"
        left_arm = "  /|  |"
        both_arms = "  /|\\ |"
        left_leg = "  /   |"
        both_legs = "  / \\ |"
        case @wrong_answers
            when 0
            puts gallows
            puts empty
            puts empty
            puts empty
            when 1
            puts gallows
            puts head
            puts empty
            puts empty
            puts empty
            when 2
            puts gallows
            puts head
            puts body
            puts empty
            when 3
            puts gallows
            puts head
            puts left_arm
            puts empty
            when 4
            puts gallows
            puts head
            puts both_arms
            puts empty
            when 5
            puts gallows
            puts head
            puts both_arms
            puts left_leg
            when 6
            puts gallows
            puts head
            puts both_arms
            puts both_legs
        end
    end

    def playing_board(guess)
        letters_arr = @@word.split("")
        # wrap the below in some sort of loop?
            correct_positions = letters_arr.each_index.select{|i| letters_arr[i] == guess}
            # returns => [0] if position 0
            # this handles if there's only one correct letter
            if correct_positions.length == 1
                if guess == letters_arr[correct_positions.join.to_i]
                    @blank_spaces_arr[correct_positions.join.to_i] = letters_arr[correct_positions.join.to_i]
                end
            # this handles if there's more than one correct letter
            elsif correct_positions.length > 1
                # make correct letters appear in the right places
                correct_positions.each do |position|
                    p position
                    if guess == letters_arr[position]
                        @blank_spaces_arr[position] = letters_arr[position]
                    end
                end
            elsif correct_positions.empty?
                puts "That letter is incorrect."
                puts "Please guess again."
                puts " "
                @wrong_answers += 1
                hangman_body
                puts " "
            end
                p @blank_spaces_arr.join
    end
    
    def parse_player_input
        guess_arr = gets.chomp
    end

    def save_game
        puts " "
        p "Saving game . . ."
        yaml = YAML.dump(self)
        File.open("save.txt", "w"){|file| file.write(yaml)}
    end

    def load_game(save_game)
        puts " "
        p "Loading game . . ."
        load_game = YAML.load(Hangman)
        data = load_game["blank_spaces_arr"]
        
    end

    def player_guess
        p @@word
        p "#{@@word} is #{@@word.length} letters long."
        while @wrong_answers <= 6
            puts ""
            puts "Please type a word or letter."
            guess = parse_player_input
            if guess == @@word
                puts "You win!"
            elsif guess == "options"
                puts " "
                options_display
            elsif guess == "exit"
                exit
            elsif guess == "save"
                save_game
            else
                p @@word
                puts " "
                playing_board(guess)
                puts " "
                puts "You have #{(7 - @wrong_answers)} wrong guesses remaining."
            end
        end
end

end

game = Hangman.new
