# frozen_string_literal: true

require_relative 'availablecolors.rb'
require_relative 'string.rb'

# Create and display boards
class Board
  include AvailableColors

  def block_display_code(code)
    puts ''
    code.each do |color|
      index = COLOR_CHOICES.find_index(color)
      print "#{COLOR_DISPLAY[index][:block_display]} "
    end
    print "\n\n"
  end

  def string_display_code(code)
    display_string = ''
    code.each do |color|
      index = COLOR_CHOICES.find_index(color)
      display_string += "#{COLOR_DISPLAY[index][:code_display]} "
    end
    display_string
  end
end
