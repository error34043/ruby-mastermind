# Methods and working for when the user plays as the codemaker

require_relative 'availablecolors.rb'
require_relative 'string.rb'
require_relative 'instructions.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'code.rb'
require_relative 'feedback.rb'
require_relative 'gameplay.rb'

class Codemaker < Code
  include AvailableColors
  include Instructions

  attr_accessor :solution_pool
  attr_reader :rounds

  @code = []
  @rounds = 0
  ARROW = "\u27eb".encode
  @solution_pool = []

  def all_the_choices
    solution_pool_temp = []
    for i in 0..5
      for j in 0..5
        for k in 0..5
          for l in 0..5
            solution_pool_temp.push([COLOR_CHOICES[i], COLOR_CHOICES[j], COLOR_CHOICES[k], COLOR_CHOICES[l]])
          end
        end
      end
    end
    solution_pool_temp
  end

  def initialize
    @solution_pool = *all_the_choices
    @rounds = 0
    @code = user_make_code
  end

  def jeeves_first_turn
    @rounds += 1
    current_board = Board.new
    jeeves_guess = solution_pool[7]
    current_board.block_display_code(jeeves_guess)
    result = code_match?(jeeves_guess, @code)
    response = Feedback.new
    pretty_pegs = response.display_feedback(result)
    if pretty_pegs == ''
      puts "#{ARROW} The feedback for round #{@rounds} is: None of the entered colors are present in Jeeves' code."
    else
      puts "#{ARROW} The feedback for round #{@rounds} is: #{pretty_pegs}"
    end
    return result
  end
end


# index of ['r','r','g','g'] is 7

# test = Codemaker.new
# test.jeeves_turn
