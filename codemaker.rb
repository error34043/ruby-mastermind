# frozen_string_literal: true

require_relative 'availablecolors.rb'
require_relative 'string.rb'
require_relative 'instructions.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'code.rb'
require_relative 'feedback.rb'
require_relative 'gameplay.rb'

# Methods and working for when the user plays as the codemaker
class Codemaker < Code
  include AvailableColors
  include Instructions

  attr_accessor :solution_pool, :current_result
  attr_reader :code, :rounds

  ARROW = "\u27eb".encode
  @code = []
  @rounds = 0
  @solution_pool = []
  @current_result = {}

  # rubocop:disable Style/For
  # rubocop:disable Metrics/BlockNesting
  # rubocop:disable Metrics/MethodLength
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
  # rubocop:enable Style/For
  # rubocop:enable Metrics/BlockNesting
  # rubocop:enable Metrics/MethodLength

  def jeeves_thinks
    print "\nJeeves is considering his options"
    3.times do
      print '.'
      sleep 0.5
    end
    puts ''
  end

  def initialize
    @solution_pool = *all_the_choices
    @rounds = 0
    @code = user_make_code
  end

  # rubocop:disable Metrics/MethodLength
  def jeeves_first_turn
    @rounds += 1
    current_board = Board.new
    jeeves_guess = solution_pool[7]
    current_board.block_display_code(jeeves_guess)
    result = code_match?(jeeves_guess, @code)
    response = Feedback.new
    pretty_pegs = response.display_feedback(result)
    if pretty_pegs == ''
      puts "#{ARROW} The feedback for round #{@rounds} is: None of Jeeves' entered colors are present in your code."
    else
      puts "#{ARROW} The feedback for round #{@rounds} is: #{pretty_pegs}"
    end
    result
  end
  # rubocop:enable Metrics/MethodLength

  def evaluate_guess(result_hash)
    result_hash_temp = {}
    (@solution_pool.length - 1).downto(0) do |index|
      result_hash_temp = code_match?(@solution_pool[index], @code)
      @solution_pool.delete_at(index) if result_hash_temp == result_hash
    end
  end

  # rubocop:disable Metrics/MethodLength
  def jeeves_turn
    @rounds += 1
    current_board = Board.new
    guess = @solution_pool.sample
    current_board.block_display_code(guess)
    result = code_match?(guess, @code)
    response = Feedback.new
    pretty_pegs = response.display_feedback(result)
    if pretty_pegs == ''
      puts "#{ARROW} The feedback for round #{@rounds} is: None of Jeeves' entered colors are present in your code."
    else
      puts "#{ARROW} The feedback for round #{@rounds} is: #{pretty_pegs}"
    end
    result
  end
  # rubocop:enable Metrics/MethodLength
end
