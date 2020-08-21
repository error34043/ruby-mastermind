# frozen_string_literal: true

require_relative 'availablecolors.rb'
require_relative 'string.rb'
require_relative 'instructions.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'code.rb'
require_relative 'feedback.rb'
require_relative 'gameplay.rb'

# Testing
replay = false
use_AI = false

test = GamePlay.new
test.new_game_begin
################### USER AND JEEVES OBJECTS CREATED; NAME AND ROLE SET

test.replay_game?
################# THIS WORKS TO RESET GET NEW INPUT FOR SPECIFYING ROLES