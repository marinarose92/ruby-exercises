class TicTacToe

    @@board_arr = [[1,2,3],[4,5,6],[7,8,9]]
    # player one's turn always comes first
    @@player_one = true
    
    
        def initialize(start_game)
            @start_game = start_game
        end
        
        def get_start_game
            @start_game
            new_board
        end
    
    # this method is called at the beginning of the game
        def new_board
            puts " "
            puts "Welcome to Tic Tac Toe."
            puts "Below is your board."
            puts " "
            p @@board_arr[0]
            p @@board_arr[1]
            p @@board_arr[2]
            puts " "
            player
        end
    
    # this method holds the win conditions
        def winner
        columns = @@board_arr.transpose
        player1_win = ["X", "X", "X"]
        player2_win = ["O", "O", "O"]
    
        # this is for diagonal matches
        top_left_diag = []
        top_right_diag = []
    
        top_right_diag << @@board_arr[0][2]
        top_right_diag << @@board_arr[1][1]
        top_right_diag << @@board_arr[2][0]
    
        top_left_diag << @@board_arr[0][0]
        top_left_diag << @@board_arr[1][1]
        top_left_diag << @@board_arr[2][2]
    
        # win conditions
            if @@board_arr[0] == player1_win || 
            @@board_arr[1] == player1_win || 
            @@board_arr[2] == player1_win || 
            columns[0] == player1_win || 
            columns[1] == player1_win || 
            columns[2] == player1_win || 
            top_left_diag == player1_win ||
            top_right_diag == player1_win
                puts "Player one wins!"
                return true
            elsif @@board_arr[0] == player2_win || 
            @@board_arr[1] == player2_win || 
            @@board_arr[2] == player2_win || 
            columns[0] == player2_win || 
            columns[1] == player2_win || 
            columns[2] == player2_win ||
            top_left_diag == player2_win ||
            top_right_diag == player2_win
                puts "Player two wins!"
                return true
            else
                return false
            end
        end
    
    # this method displays the current board
        def display_board
            puts " "
            p @@board_arr[0]
            p @@board_arr[1]
            p @@board_arr[2]
            puts " "
        end
    
    # this holds the instructions/actions for participating players
        def player
            # this sets variables based on whose turn it is
            if @@player_one == true
            value = "X"
            player_name = "Player one"
            else
            value = "O"
            player_name = "Player two"
            end
            # player participation using above variables
            puts "#{player_name}, which row would you like to modify?"
            row = gets.chomp.to_i
            puts "Which column would you like to modify?"
            col = gets.chomp.to_i
            # this accounts for the zero index
            row = row - 1
            col = col - 1
                # check if that space is free
                if @@board_arr[row][col] != "O" && @@board_arr[row][col] != "X"
                # reassign this item to value [X or O]
                    @@board_arr[row][col] = value
                else
                # error message, repeat input
                puts " "
                puts "That spot has already been taken."
                puts " "
                player
                end
            display_board
                # check for winner
                    if winner
                    return
                    else
                        if @@player_one
                        @@player_one = false
                        else
                        @@player_one = true
                        end
                    player
                    end
        end
    
    end
    
    new_game = TicTacToe.new("New Game")
    new_game.get_start_game