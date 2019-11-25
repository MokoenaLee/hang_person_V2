Hangperson:
=================================================================================================
Hangperson is a game that applies the same logic as the hangman game, the name twist is intended for a more inclusive audience. This game is intended to be a web application developed in Ruby on Rails. The game logic is as follows: 
- an API call is made to  a random word generator website
- a player is given 8 attempts to guess the word by guessing the letters in the word
- every wrong guess is recorded in order to determine when the player has reached the maximum guessing attempts

What I developed:
=================

-All the methods that determine the game logic (Refer to the path: hang_person_V2/lib/hangperson_game.rb). First, as a standalone component from the SaaS project (i.e setting up the class and methods in a IDE locally on the computer) and Secondly intergrating it into the SaaS framework (For routing/ testing)
-Mapping resource routes to HTTP requests


Key takeaways
==============
-Importance of BDD and TDD during development
-Service-Oriented-Architecture
-Adapting a non-SaaS application to a SaaS environment 


Tests
=================
All 18 are passing

Pre-existing:
=================
   -Scaffold including: BDD tests and guiding instructions to help complete the assignment
   - on github: hw-sinatra-saas-hangperson 

