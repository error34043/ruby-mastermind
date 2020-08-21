require_relative 'availablecolors.rb'
require_relative 'string.rb'

# Create and display boards
class Board
  include AvailableColors

  def display_code(code)
    puts ''
    code.each do |color|
      index = COLOR_CHOICES.find_index(color)
      print "#{COLOR_DISPLAY[index][:block_display]} "
    end
    puts "\n"
  end
end
