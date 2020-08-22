require_relative 'string.rb'

# Create and display feedback statements
class Feedback
  PEG = "\u2b23".encode

  def full_correct_peg
    PEG.green
  end

  def partial_correct_peg
    PEG.red
  end

  def display_feedback(result_hash)
    pegs = ''
    number_correct = result_hash[:c]
    number_partial = result_hash[:p]
    1.upto(number_correct) do
      pegs += "#{full_correct_peg} "
    end
    1.upto(number_partial) do
      pegs += "#{partial_correct_peg} "
    end
    return pegs
  end
end
