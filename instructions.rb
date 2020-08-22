require_relative 'string.rb'
require_relative 'feedback.rb'

# Contains game instructions
module Instructions
  def logo
    "\n\t\t\t\t███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗██████╗ 
       \t\t\t\t████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗
       \t\t\t\t██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ██║
       \t\t\t\t██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║  ██║
       \t\t\t\t██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██████╔╝
       \t\t\t\t╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝ \n\n"
  end
  
  def introduction
    "Mastermind is a game in which one player sets a code made up of 4 colored pegs.\nThe other player has to guess which colors are in the code and in which order within 12 turns to win.\nThe same color can be used in the code more than once if the codemaker so wishes.\n\nAt the end of each turn, the codebreaker will recieve feedback consisting of green and red pegs.\n" +  "#{Feedback.new.full_correct_peg} -> Each green peg indicates that one of the colored pegs in the code that the codebreaker has guessed is the " + "right".green + " color in the " + "right".green + " place.\n" + "#{Feedback.new.partial_correct_peg} -> Each red peg indicates that one of the colored pegs in the code that the codebreaker has guessed is the " + "right".green + " color but in the " + "wrong".red + " place.\n\n"
  end

  def jeeves
    "In this game, your opponent will be me, " + "\e[07mJeeves\e[0m" + ". I'm new to the game and still have a lot to learn, but I can guarantee that we'll have fun playing!"
  end

  def valid_code
    "\nA valid code is one which contains 4 lowercase letters with no spaces between them. Each letter represents one color, as follows:" + "\n-- red, " + 'r'.red + "\n-- Green, " + 'g'.green + "\n-- Yellow, " + 'y'.yellow + "\n-- Blue, " + 'b'.blue + "\n-- Magenta, " + 'm'.magenta + "\n-- Teal, " + 't'.teal
  end
end
