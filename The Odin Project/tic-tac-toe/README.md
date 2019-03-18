# Tic Tac Toe

The assignment for this project is as follows:

```
Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.
```

The `start_game` method begins the same by calling the `new_board` method which renders a new Tic Tac Toe board on screen. I used a two-dimensional array to display each position in three columns and three rows.

The `player` method holds all of the actions available to the players. I decided that whether or not the `@@player_one` class variable is true will determine whether the player can be an "X" or an "O" and whether or not it is their turn.

I use user input via the terminal to get a "sanitized" version of the column and row position. This means I do some math to account for the zero index so the player doesn't need to keep track of that stuff. Then a version of the `@@board_arr` is modified depending on the position being input by the user.

I included an applicable error message so that a user can't overwrite another spot on the board, regardless of whether it's their own spot, or opponents.

At the end of the `player` method, I check to see if a winner has been determined. If so, it returns and the game is over. If not, it swaps the value of `@@player_one` from true to false (and back again on further iterations).

My `winner` method transposes the 2D array so I can easily grab the values of the columns as well as the rows. I state the win condition in the two variables `player1_win` and `player2_win` for each player respectively. 

I then manually populate two arrays which represent the two possible diagonal "rows" of letters, `top_left_diag` and `top_right_diag`.

Then in one giant `if` statement, I run through the win conditions for each player. I hope to come back and refactor this in the future because it is a little crowded, but for now, it works. :)


