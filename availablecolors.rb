require_relative 'string.rb'

# Array of possible colors included in the code
module AvailableColors
  COLOR_CHOICES = %w[r g y b m t].freeze
  # Colors are: Red, Green, Yellow, Blue, Magenta, and Teal

  COLOR_DISPLAY = [
    {
      color: 'red',
      code: 'r',
      block_display: '  '.bg_red,
      code_display: 'r'.red
    },
    {
      color: 'green',
      code: 'g',
      block_display: '  '.bg_green,
      code_display: 'g'.green
    },
    {
      color: 'yellow',
      code: 'y',
      block_display: '  '.bg_yellow,
      code_display: 'y'.yellow
    },
    {
      color: 'blue',
      code: 'b',
      block_display: '  '.bg_blue,
      code_display: 'b'.blue
    },
    {
      color: 'magenta',
      code: 'm',
      block_display: '  '.bg_magenta,
      code_display: 'm'.magenta
    },
    {
      color: 'teal',
      code: 't',
      block_display: '  '.bg_teal,
      code_display: 't'.teal
    }
  ].freeze
end
