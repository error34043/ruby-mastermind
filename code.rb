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

  def code_input_check(input)
    if input.length != 4
      puts "\nPlease enter a code that is 4 letters long."
      return false
    elsif valid_input?(input) == false
      puts "\nPlease enter a valid code. "
      puts valid_code
      return false
    else
      return true
    end
  end

  def user_guess
    puts "Please input your guess as 4 letters, one for each colored peg, with no spaces. (eg: rgby)"
    pass = false
    while pass == false
      print "[Guess]: "
      guess = gets.chomp.downcase.split('').freeze
      pass = code_input_check(guess)
    end
    return guess
  end

  def code_match?(guess, jeeves_code)
    guess_temp = guess
    jeeves_code_temp = jeeves_code
    results = {c: 0, p: 0}
    (guess_temp.length - 1).downto(0) do |index|
      if guess_temp[index] == jeeves_code_temp[index]
        results[:c] += 1
        guess_temp.delete_at(index)
        jeeves_code_temp.delete_at(index)
      end
    end
    guess_temp.each do |color|
      if jeeves_code_temp.include? color
        results[:p] += 1
      end
    end
    return results
  end

  def user_make_code
    pass = false
    while pass == false do
      print 'Please enter the code to set [eg: rgby]: '
      input_code = gets.chomp.downcase.split('').freeze
      pass = code_input_check(input_code)
    end
    return input_code
  end
end
