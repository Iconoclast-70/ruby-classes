require './Game'

class Player < Game
  attr_accessor :lives

  def initialize
    @lives = 3
  end
end