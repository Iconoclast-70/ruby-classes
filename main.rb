require './Game'
require './Player'

# Create a new Game object along with two Player objects that inherit from Game
math_game = Game.new
player1 = Player.new
player2 = Player.new

# Initialize playing state
math_game.set_player(1)
playing = true

while playing

  # Generate a new random math question and get the answer from the current player
  puts math_game.generate_question
  print "> "
  answer = $stdin.gets.chomp 
  # Determine if the player entered the correct answer
  if answer.to_i == math_game.current_answer.to_i
    puts "YES! You are correct."
  else
    puts "Seriously? No!" 
    # recalculate the number of lives for the current player if a wrong answer was entered
    if math_game.player.to_i == 1
      player1.lives = player1.lives.to_i - 1
    else
      player2.lives = player2.lives.to_i - 1
    end
  end
  
  # Indicate a new turn to the user
  puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
  puts "----- NEW TURN -----"

  # Set the state of the current player
  math_game.player.to_i == 1 ? math_game.set_player(2) : math_game.set_player(1)

  # Test to see if there is a winner
  if player1.lives.to_i == 0 
    puts "Player 2 wins with a score of #{player2.lives}/#{player1.lives}"
    puts "----- GAME OVER -----"
    playing = false
  elsif player2.lives.to_i == 0 
    puts "Player 1 wins with a score of #{player1.lives}/#{player2.lives}"
    puts "----- GAME OVER -----"
    playing = false
  end

end