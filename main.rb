# frozen_string_literal: true

require_relative 'availablecolors.rb'
require_relative 'string.rb'
require_relative 'instructions.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'code.rb'
require_relative 'feedback.rb'
require_relative 'gameplay.rb'

# Define game methods
class GamePlay
  def start
  end

  def decide_roles
  end
  
  def user_codebreak_turn
  end
end

# Testing
test = Board.new
test.display_code(['r', 'r', 'r', 'r'])