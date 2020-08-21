# Methods and working for when the user plays as the codebreaker

require_relative 'availablecolors.rb'
require_relative 'string.rb'
require_relative 'instructions.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'code.rb'
require_relative 'feedback.rb'
require_relative 'gameplay.rb'

class Codebreaker < Code
  include AvailableColors
  include Instructions

  attr_accessor :code
  
  @code = []

  def initialize
    @code = create_random_code
  end

  def turn
    current_board = Board.new
    guess = user_guess
    current_board.block_display_code(guess)
    puts @code
    p result = code_match?(guess, @code)
  end
end


# Testing
=begin
test = Codebreaker.new
12.times do
  current = test.turn
  if current[:c] == 4
    break
  end
end
=end