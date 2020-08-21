# Instances set player attributes
class Player
  attr_accessor :role
  attr_reader :name

  ROLES = %w[null codebreaker codemaker].freeze

  def initialize(name, role = 0)
    @name = name
    @role = ROLES[role]
  end

  def specify_role=(role_choice)
    @role = ROLES[role_choice]
  end
end
