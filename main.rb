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

def replay?(game, flag)
  game.replay_game?(flag)
end

# Testing
replay = true
use_AI = false

game = GamePlay.new
game.new_game_begin
################### USER AND JEEVES OBJECTS CREATED; NAME AND ROLE SET

if game.codemaker.name == 'Jeeves'
  use_AI = false
else
  use_AI = true
end
### DECIDES WHICH LOOP TO FOLLOW

# Loop for when user is the codebreaker
if @use_AI == false

end

# Loop for when user is the codemaker
if @use_AI == true

end

#replay?(game, replay)
################## THIS WORKS TO RESET GET NEW INPUT FOR SPECIFYING ROLES