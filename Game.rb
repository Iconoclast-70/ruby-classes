class Game
  @@answer
  @@current_player

  def initialize
    @@current_player = 1
  end

  def generate_question
    num1 = rand(1..50).to_i
    num2 = rand(1..50).to_i
    @@answer = num1 + num2
    puts "Player #{@@current_player}: What does #{num1} plus #{num2} equal?"
  end

  def current_answer
    @@answer
  end

  def set_player(player)
    @@current_player = player.to_i
  end

  def player
    @@current_player
  end

end