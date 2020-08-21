require_relative 'availablecolors.rb'
require_relative 'string.rb'
require_relative 'instructions.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'code.rb'
require_relative 'feedback.rb'

# Define game methods
class GamePlay
  include AvailableColors
  include Instructions

  attr_accessor :codemaker, :codebreaker

  @codemaker = ''
  @codebreaker = ''
  @win = false
  @number_of_turns = 0
  @user_name = ''
  

  def start
    puts logo
    puts introduction
    puts jeeves
    print "\nWhat is your name? "
    player_name = gets.chomp
    puts "\nLovely to meet you, #{player_name}."
    @user_name = player_name
  end

  def decide_roles(player1, player2)
    puts "Would you like to crack a code or make one?"
    puts "1. Break a code"
    puts "2. Make a code"
    while true
      print "[1/2]: "
      user_choice = gets.chomp.to_i
      if user_choice == 1
        player1.specify_role = 1
        player2.specify_role = 2
        @codebreaker = player1
        @codemaker = player2
        break
      elsif user_choice == 2
        player1.specify_role = 2
        player2.specify_role = 1
        @codebreaker = player1
        @codemaker = player2
        break
      else
        puts "Please enter either 1 or 2."
      end
    end
  end

  def new_game_begin
    user = Player.new(start)
    jeeves = Player.new('Jeeves')
    decide_roles(user, jeeves)
  end
  
  def replay_game?
    puts "Great game, #{@user_name}! Would you like to play again?"
    while true
      print "[y/n]: "
      input = gets.chomp.downcase
      if input == 'y' || input == 'yes'
        user = Player.new(@user_name)
        jeeves = Player.new('Jeeves')
        decide_roles(user, jeeves)
        break
      elsif input == 'n' || input == 'no'
        puts "Very well. Thank you for playing and I hope to see you again soon!"
        break
      else
        puts "I didn't quite get that. Would you like to play again?"
      end
    end
  end

  def user_codebreak_turn
  end
end
