# Mastermind game in ruby

This is a cli version of mastermind board game
https://en.wikipedia.org/wiki/Mastermind_(board_game)

Player has the choice to be the creator of the combination (that our program will have to guess), or the guesser of a combination created by our program. 
The combination must contain 4 numbers between 1 and 6.
This program was inspired by the Odin's project Ruby path.
https://www.theodinproject.com/lessons/ruby-mastermind
The guessing algorithm was made based on the following Adam Forsyth's conference.
https://www.youtube.com/watch?v=Okm_t5T1PiA&t=1860s&ab_channel=Confreaks

## How to play
You must have a ruby version installed on your machine.
Execute the scrypt.
At the first question, enter "creator" or "guesser" depending on the type of gameplay you're choosing.
Then enter your 4 number combination, without formatting, like this e.g. : "1156".
You'll receive feedback in form of black and white score.
black meaning you guessed a good number at the good position.
white meaning you guessed a good number at the wrong position.
As a guesser you have 10 rounds to find the good combination.


