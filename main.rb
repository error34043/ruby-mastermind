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
####
def replay?(game, ai_flag, replay_flag)
  game.replay_game?(ai_flag, replay_flag)
end


play = true

begin_game = GamePlay.new
use_AI = begin_game.new_game_begin(use_AI)
puts begin_game.valid_code
player1 = begin_game.codemaker
player2 = begin_game.codemaker
################### USER AND JEEVES OBJECTS CREATED; NAME AND ROLE SET; use_AI value set

while play == true

  # Loop for when user is the codebreaker
  if use_AI == false
    win = false
    current_game = Codebreaker.new
    jeeves_code = current_game.code
    code_display = Board.new
    jeeves_code_display = code_display.string_display_code(jeeves_code).strip
    12.times do
      current = current_game.turn
      if current[:c] == 4
        puts "Well done, #{begin_game.user_name}! You've cracked my code, which was: #{jeeves_code_display}."
        win = true
        break
      end
    end
    unless win
      puts "Too bad, #{begin_game.user_name}. You have failed to crack my code, which was: #{jeeves_code_display}."
    end
  end


  #####
  # Loop for when user is the codemaker
  # if use_AI == true

  # end
  #####

  play = begin_game.replay_game?(use_AI)
  break if play == false
  use_AI = begin_game.decide_roles(player1, player2)
  ################## THIS WORKS TO GET NEW INPUT FOR SPECIFYING ROLES
end