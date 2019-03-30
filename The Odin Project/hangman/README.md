# Hangman

This project was taken from a module of The Odin Project.


The goal for this project is to implement serialization to save the game. The overall functionality builds upon previous concepts of encapsulation - the act of breaking up parts of the program into their own individual methods.

My game initializes by calling the `introduction` method which is just a simple welcome screen. Then, it displays five options available to the player: 1. New Game, 2. Load Game, 3. Rules, 4. Save and 5. Exit to Main Menu. I also set it up so that any time the player types "options" as their input, this menu appears again.

My options are in two methods: `options_display` and `options_logic`. The logic processes the player's input and directs them to a part of the game depending on which object is chosen. A glaring flaw of this method is that it takes any input - I had some issues with restricting input because of the load feature. When a game is loaded, the method takes that as input which caused some problems, so I removed a piece that forces players to choose a valid option, for now.

Beginning a new game triggers the `new game` method which outputs feedback to let the player know a new game has started. Then it calls the `display_feedback` method which first prints the `hangman_body` method. I created the body in pieces and then used a `case` statement to display the correct order of 'hangman pieces'. 

`display_feedback` then prints an array of blank spaces, letting the player know how many letters are in the word. It then asks the user for input. I made a separate `parse_user_input` method to grab the guesses. I can probably make this default to downcase so that it doesn't get confused with capital/lowercase letters.

`display_feedback` goes on to let players know whether or not their guess was correct. It also tracks the number of wrong guesses, so the player knows how many chances they have left.

If a guess is wrong, the program calls the `check_player_guesses` method, passing the `guess` as an argument. This method checks the randomly selected word and compares the player's guess to it, and then depending on whether or not the letter is found in the word, it prompts the user to guess again. It also displays the incorrect guesses so the user can keep track of which letters they've already guessed. One bug here is that it allows the user to guess the same incorrect letters over and over again, thus wasting their incorrect guesses. I'd like to find a way to prevent that in the future, and instead just ask the player to guess again without deducting more guesses (that seems fair).

Once the player is out of incorrect guesses, the game is over. If the user guesses the entire word, they win!

The save/load feature was definitely the biggest struggle for me. I realized that I needed to grab the exact variables that I'd want to load back up and for this situation that turned out to be the array of blank lines/letters `@blank_spaces_arr`, the list of incorrect guesses `@wrong_guesses`, the number of incorrect answers `@wrong_answer` and of course, the chosen word `@word`. It saves this information to a file `save.yml`. 

When the game is loaded, it reads these files and reassigns the original variables to these values, so the player can pick up right where they left off. 

