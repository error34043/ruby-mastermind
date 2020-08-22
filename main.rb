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

def replay?(game, ai_flag, replay_flag)
  game.replay_game?(ai_flag, replay_flag)
end


play = true

begin_game = GamePlay.new
use_AI = begin_game.new_game_begin
puts begin_game.valid_code
player1 = begin_game.codemaker
player2 = begin_game.codebreaker

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


  # Loop for when user is the codemaker
  if use_AI == true
    win = false
    current_game = Codemaker.new
    user_code = current_game.code
    code_display = Board.new
    user_code_display = code_display.string_display_code(user_code).strip
    current_result = current_game.jeeves_first_turn
    if current_result[:c] == 4
      win = true
      puts "Looks like I've bested you, #{begin_game.user_name}! I guessed your code to be #{user_code_display}."
    else
      current_game.jeeves_thinks
      current_game.evaluate_guess(current_result)
      10.times do
        current_result = current_game.jeeves_turn
        if current_result[:c] == 4
          win = true
          puts "Looks like I've bested you, #{begin_game.user_name}! I guessed your code to be #{user_code_display}."
          break
        end
        current_game.jeeves_thinks
        current_game.evaluate_guess(current_result)
      end
      if win == false
        current_result = current_game.jeeves_turn
        if current_result[:c] == 4
          win = true
          puts "Looks like I've bested you, #{begin_game.user_name}! I guessed your code to be #{user_code_display}."
        end
      end
      if win == false
        puts "#{user_code_display}, I never would have guessed that. You have bested me, #{begin_game.user_name}, and I bow down to you. Please teach me your ways."
      end
    end
  end

  play = begin_game.replay_game?(use_AI)
  break if play == false
  use_AI = begin_game.decide_roles(player1, player2)
end