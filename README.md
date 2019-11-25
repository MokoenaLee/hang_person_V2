The Guesser's Quest:
=================================================================================================
The Guesser's Quest is a game that applies the same logic as the hangman game where a user is given a fixed number of attempts to guess the characters in a word. I have developed this game as a webapplication using Ruby on Rails and deployed to the cloud as a Heroku app.

The game logic is as follows: 
- an API call is made to  a random word generator website (watchout4snakes.com)
- a player is given a 7 attempts to guess the word that has been randomly generated, one character at a time 
- player is notitfied of any repeated guesses
- the applicaiton keeps track of the number of right and wrong guesses made at each stage and ignored repeated characters
- at each stage the player is able to see the characters they have already guessed and the right guesseses that they have made
- If a word contains repeated characters then those are filled in appropriately, e.g if the word is 'banana' and the player guesses 'n' then all the places where an 'n' appears are filled in and the remaining characters have a '-' displayed in their place
- every wrong guess is recorded in order to determine when the player has reached the maximum guessing attempts which will lead to a 'loss' game result
- a win message is flashed across the screen upon successful guessing within the specified number of attempts
- a player also has the option to continue playing the game if they have neither lost nor won

Project Components: (hang_person_V2/lib/hangperson_game.rb)
===================
- The game components for are structured using the Model View Controller design pattern to containerize the game logic

 
 #### Order Context:
- I developed the class logic first, as a standalone component from the SaaS project and then later integrated the game logic class into the SaaS framework  to include routing
- The filepath specified above leads to the class that contains the logic that handles guesses made, right and wrong guesses as well as how to determine a win and a lose
- Mapping resource routes to HTTP requests

 
Tests (hang_person_V2/spec/hangperson_game_spec.rb)
====================================================
I have written 18 rspec tests to ensure that the code is working as expected. 

I wrote these tests when I was adapting my non- SaaS application to a SaaS based application to ensure:
- that the application displays expected behavior when the user first navigates to the starting page and initiates a game
 -- that the number of both wrong and correct guesses is zero and that this state changes after a guess is made
- that the application responds to both correct and incorrect guesses by flashing the appropriate messages and updating the respective arrays. 

 =====================
| All 18 are passing  |
 =====================

Key takeaways
==============
- Understanding how SaaS works through adapting a non-SaaS application to a SaaS environment 
- Understanding how routing works for a RESTful infrastructure
- Understanding the importance of Behavior Driven Design and Test Driven Development during development
- Understanding containerizing logic through the Model View Controller design pattern





