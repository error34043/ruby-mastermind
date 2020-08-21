# frozen_string_literal: true

# Add colors to strings
class String
  def use_code(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  # rubocop:disable Layout/EmptyLineBetweenDefs
  # rubocop:disable Style/SingleLineMethods
  def red;          use_code(31) end
  def green;        use_code(32) end
  def yellow;       use_code(33) end
  def blue;         use_code(34) end
  def magenta;      use_code(35) end
  def teal;         use_code(36) end

  def bg_red;       use_code(41) end
  def bg_green;     use_code(42) end
  def bg_yellow;    use_code(43) end
  def bg_blue;      use_code(44) end
  def bg_magenta;   use_code(45) end
  def bg_teal;      use_code(46) end
  # rubocop:enable Layout/EmptyLineBetweenDefs
  # rubocop:enable Style/SingleLineMethods
end

# Create Player objects
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

# Create boards
class Board
  PEG = "\u2b23".encode

  def full_correct_peg
    PEG.green
  end

  def partial_correct_peg
    PEG.red
  end
end

# Define game methods
class GamePlay
end

# Testing
arrow = "\u27eb"
test = Board.new
x = "#{arrow} Feedback for this round: "
2.times do
  x += "#{test.full_correct_peg} #{test.partial_correct_peg} "
end
puts x

puts 'Hello, my name is Jeeves. Shall we play a game?'
print '[y/n]: '.blue
choice = gets.chomp
if choice == 'y'
  puts 'Wonderful. What is your name?'
  name = gets.chomp
  player = Player.new(name)
  puts "Lovely to meet you, #{player.name}. Would you like to make a code or crack one?"
  puts '1. Break a code'
  puts '2. Make a code'
  print '[1/2]: '.blue
  role_choice = gets.chomp.to_i
  puts role_choice.is_a? Integer
end
