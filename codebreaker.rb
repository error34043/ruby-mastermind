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
  end
end


# Testing
test = Codebreaker.new
p test.code
