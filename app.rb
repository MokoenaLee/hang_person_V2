require 'sinatra/base'
require 'sinatra/flash'
require 'rubygems'
require './lib/hangperson_game.rb'

class HangpersonApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  before do
    @game = session[:game] || HangpersonGame.new('')
  end

  after do
    session[:game] = @game
  end

  #Sinatra syntax for routing
  get '/' do
    erb :index, :layout => :post 
    #redirect '/new'
  end

  get '/new' do
    erb :new
  end

  post '/create' do
    word = params[:word] || HangpersonGame.get_random_word
    @game = HangpersonGame.new(word)
    redirect '/show'
  end

  # Use existing methods in HangpersonGame to process a guess.
  # If a guess is repeated, set flash[:message] to "You have already used that letter."
  # If a guess is invalid, set flash[:message] to "Invalid guess."

  post '/guess' do
     letter = params[:guess].to_s[0]

     @guess = @game.guess(letter)

     if @guess == false
       flash[:message] ="Invalid guess."
       @w_guesses = @game.guesses_so_w
     else
      flash[:message] = "correct guesses so far"
      @r_guesses = @game.guesses_so_r
     end

    redirect '/show'
  end



  # Everytime a guess is made, we should eventually end up at this route.
  # Use existing methods in HangpersonGame to check if player has
  # won, lost, or neither, and take the appropriate action.
  # Notice that the show.erb template expects to use the instance variables of the HangPersonGame class
  # wrong_guesses and word_with_guesses from @game.
  get '/show' do
     if @game.check_win_or_lose == :win
       flash[:message] = "CONGRATULATIONS, you've won the game!"
       @win = @game.word_with_guesses
     elsif @game.check_win_or_lose == :lose
       flash[:message] = "You Lost. Restart to try again"
       @lost = @game.word_with_guesses
     else
       flash[:message] = "Play On"
       redirect '/guess'
     end


  end

  get '/win' do
    if @game.check_win_or_lose == :win
      flash[:message] = "You're a winner!"
    end
  end

  get '/lose' do
     if @game.check_win_or_lose == :lose
         erb :lose
     end

  end


end
