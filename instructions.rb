require_relative 'string.rb'

# Contains game instructions
module Instructions
  def valid_code
    "A valid code is one which contains 4 letters with no spaces between them. Each letter represents one color, as follows:" + "\n-- red, " + 'r'.red + "\n-- Green, " + 'g'.green + "\n-- Yellow, " + 'y'.yellow + "\n-- Blue, " + 'b'.blue + "\n-- Magenta, " + 'm'.magenta + "\n-- Teal, " + 't'.teal
  end
end
