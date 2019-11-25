Hangperson:
=================================================================================================
Hangperson is a game that applies the same logic as the hangman game, the name twist is intended for a more inclusive audience. This game is intended to be a web application developed in Ruby on Rails. The game logic is as follows: 
- an API call is made to  a random word generator website
- a player is given a fixed number of attempts to guess the word by guessing the letters in the word
- player is notitfied of any repeated guesses
- every wrong guess is recorded in order to determine when the player has reached the maximum guessing attempts
- win message is flashed upon successful guessing withing the specified number of attempts
- upon loss, display message and encourage user to continue

Project Components:
=================

- Game logic (Refer to the path: hang_person_V2/lib/hangperson_game.rb). 
  - First, as a standalone component from the SaaS project (i.e setting up the class and methods in a IDE locally on the computer)
  - Secondly intergrating the game logic class into the SaaS framework (For routing/ testing)
- Mapping resource routes to HTTP requests


Key takeaways
==============
- -Understanding how SaaS works through adapting a non-SaaS application to a SaaS environment 
- Understanding how routing works for a RESTful infrastructure
- Understanding the importance of Behavior Driven Design and Test Driven Development during development




Tests
=================
I have written accceptance tests to ensure that the code is working as expected. I wrote these tests when I was adapting my non- SaaS application to a SaaS based application to ensure:
- that the applicaiton displays expected behavior when the user first navigates to the starting page and initiates a game
- that the application responds to both correct and incorrect guesses by flashing the appropriate messages
 ==================
| All 18 are passing |
 ==================
