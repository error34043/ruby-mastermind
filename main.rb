# frozen_string_literal: true

require_relative 'availablecolors.rb'
require_relative 'string.rb'
require_relative 'instructions.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'code.rb'
require_relative 'feedback.rb'
require_relative 'gameplay.rb'
require_relative 'codebreaker.rb'
require_relative 'codemaker.rb'
=begin
def replay?(game, flag)
  game.replay_game?(flag)
end


replay = true
=end
begin_game = GamePlay.new
use_AI = begin_game.new_game_begin(use_AI)
################### USER AND JEEVES OBJECTS CREATED; NAME AND ROLE SET; use_AI value set

# Loop for when user is the codebreaker
if use_AI == false
  current_game = Codebreaker.new
  12.times do
    current = current_game.turn
    if current[:c] == 4
      break
    end
  end
end


=begin
# Loop for when user is the codemaker
if use_AI == true

end

#replay?(game, replay)
################## THIS WORKS TO RESET GET NEW INPUT FOR SPECIFYING ROLES
=end