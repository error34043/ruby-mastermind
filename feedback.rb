require_relative 'string.rb'

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
