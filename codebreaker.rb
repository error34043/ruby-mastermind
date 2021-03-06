# frozen_string_literal: true

require_relative 'availablecolors.rb'
require_relative 'string.rb'
require_relative 'instructions.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'code.rb'
require_relative 'feedback.rb'
require_relative 'gameplay.rb'

# Methods and working for when the user plays as the codebreaker
class Codebreaker < Code
  include AvailableColors
  include Instructions

  attr_reader :code, :rounds
  @code = []
  @rounds = 0
  ARROW = "\u27eb".encode

  def initialize
    @code = create_random_code
    @rounds = 0
  end

  # rubocop:disable Metrics/MethodLength
  def turn
    @rounds += 1
    current_board = Board.new
    guess = user_guess
    current_board.block_display_code(guess)
    result = code_match?(guess, @code)
    response = Feedback.new
    pretty_pegs = response.display_feedback(result)
    if pretty_pegs == ''
      puts "#{ARROW} The feedback for round #{@rounds} is: None of the entered colors are present in Jeeves' code."
    else
      puts "#{ARROW} The feedback for round #{@rounds} is: #{pretty_pegs}"
    end
    result
  end
  # rubocop:enable Metrics/MethodLength
end
