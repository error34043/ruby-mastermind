require_relative 'availablecolors.rb'
require_relative 'string.rb'
require_relative 'instructions.rb'

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

  def user_make_code
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

  def code_match?
  end
end
