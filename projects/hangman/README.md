# Hangman - Word game

## Project description
Hangman is a simple project written in Shell that implements the popular word game of the same name. The game involves guessing the word by guessing the letters before the hanged person is drawn.

## How to play?
After starting the program, a menu will appear with the option to start a new game. The player's task is to guess the hidden word by entering individual letters. The player has a limited number of attempts to guess the word before drawing the hanged man. After each attempt, the program will inform the player whether the entered letter appears in the word and will show the current status of the word being guessed.

## Game features
Word Random: The program randomly selects one word from a predefined list of words that the player will try to guess.

Guessing letters: The player can enter individual letters. The program checks whether the letter appears in the word and updates the status of the guessed word.

Displaying the game status: After each attempt, the program will inform the player whether the letter entered is part of a word and will show the current status of the word being guessed, with the letters still hidden.

Drawing a Hanged Man: If the player fails to guess the word before the attempt limit is reached, the program draws elements of a hanged man on the screen, symbolizing the progressing state of the hanged man.

Game End: The game ends when the player guesses the word or when the hanged man is completely drawn.

## Starting the game
The Hangman game was written in Python 3. To run the game, make sure you have the Python 3 interpreter installed on your computer. Then type python hangman.py in the terminal to start the game.

## Requirements
- bash/linux

## Comments
The Hangman game is created for recreational and entertainment purposes. It may be extended with additional features or optimized for interactivity in future versions.
