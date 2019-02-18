class HangpersonGame
   attr_accessor :word
   attr_accessor :guesses
   attr_accessor :wrong_guesses
   attr_accessor :w_result
   
   
    
#initializing the variables used in the program
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @@guesses_right_far = []
    @@guesses_wrong_far = []
  
    
  end
  
 
#keeping list of correct and incorrect guesses so far by adding characters to the list
#ensure that if user enters more than one character variables remain unchanged
#also ensure that character has not been guessed before
#the return booleans are confirming whether or not the appropriate variable was changed

 def guess(char_input)
  
  
  if (char_input == '') || (char_input =~ /\W/) || (char_input == nil)
    raise ArgumentError
  end
 
    char_input.downcase!


    if @word.include?(char_input) && char_input.length ==1 && !(@@guesses_right_far.include?(char_input))
      @@guesses_right_far << char_input
      @guesses = char_input
      @wrong_guesses = ''
      return true
    elsif @@guesses_right_far.include?(char_input) 
         @guesses = char_input
         @wrong_guesses = ''
       return false
    elsif @@guesses_wrong_far.include?(char_input)
        @wrong_guesses = char_input
        @guesses = ''
        return false 
    else
       @@guesses_wrong_far << char_input
       @wrong_guesses = char_input
       @guesses = ''
        
       return true
   end 
      
 end
 
#methods to display the arrays of correct and incorrect gueses at each stage 
 def self.guesses_so_r
    puts "Right guess #{@@guesses_right_far}"
 end 
      
 def self.guesses_so_w
    puts "Wrong guess #{@@guesses_wrong_far}" 
 end
     
#method to display the guessed word thus far, only the characters in the word to be guessed are included
  def word_with_guesses
    w_hold = @word
    word_array= @word.chars
    guess_right= @@guesses_right_far
    s_out  = "" 
    indices = []
    word_array.each do |x|
    indez = w_hold.index(x)
     
     indices.push(indez)
     w_hold[indez] = "/"
     
     if (guess_right.include?(x))
         s_out.insert(indez,x)
     elsif  indices.include?(indez)
          s_out.insert(indez,"-")
      else
          s_out.insert(indez,"-")   
     end
    end
    return s_out
  end
     

#method to determine whether the player wins or loses
 def check_win_or_lose()
    if @@guesses_right_far.length == @word.length
       return :win
    elsif @@guesses_wrong_far.length >=7
       return :lose
    else
       return :play
    end
    
 end

 #Service-Oriented-Architecture...random word generator used for each round of the game

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

end
