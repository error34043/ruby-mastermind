# frozen_string_literal: true

# Array of possible colors included in the code
module AvailableColors
  COLOR_CHOICES = %w[r g y b m t].freeze
  # Colors are: Red, Green, Yellow, Blue, Magenta, and Teal
end

# Contains game instructions
# rubocop:disable Style/StringLiterals
# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/AbcSize
module Instructions
  def valid_code
    "A valid code is one which contains 4 letters with no spaces between them. Each letter represents one color, as follows:" + "\n-- red, " + 'r'.red + "\n-- Green, " + 'g'.green + "\n-- Yellow, " + 'y'.yellow + "\n-- Blue, " + 'b'.blue + "\n-- Magenta, " + 'm'.magenta + "\n-- Teal, " + 't'.teal
  end
end
# rubocop:enable Style/StringLiterals
# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/AbcSize

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

# Instances set player attributes
class Player
  attr_accessor :role
  attr_reader :name

  ROLES = %w[null codebreaker codemaker].freeze

  def initialize(name)
    @name = name
  end

  def specify_role=(role_choice)
    @role = ROLES[role_choice]
  end
end

# Create and display boards
class Board
end

# Create random codes and check for code matches
class Code
  include AvailableColors
  include Instructions

  def create_random_code
    [COLOR_CHOICES[rand(0..5)], COLOR_CHOICES[rand(0..5)], COLOR_CHOICES[rand(0..5)], COLOR_CHOICES[rand(0..5)]].freeze
  end

  def valid_input?(array)
    result_arr = []
    array.each do |color|
      if COLOR_CHOICES.include? color
        result_arr.push(true)
      else
        result_arr.push(false)
      end
    end
    validity = result_arr.include? false
    validity ? false : true
  end

  def make_code # rubocop:disable Metrics/MethodLength
    loop do
      print 'Please enter the code to set [eg: rgby]: '
      input_code = gets.chomp.downcase.split('').freeze
      if input_code.length != 4
        puts "\nPlease enter a code that is 4 letters long."
      elsif valid_input?(input_code) == false
        puts "\nPlease enter a valid code. "
        puts valid_code
      else
        return input_code
      end
    end
  end
end

# Create and display feedback statements
class Feedback
  PEG = "\u2b23".encode
  ARROW = "\u27eb".encode

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
