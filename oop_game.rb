#object oriented version of the 2-player math game

require './player_class.rb'
require 'byebug'

def ask(player)
  num1 = rand(1..20)
  num2 = rand(1..20)
  puts "Player #{player.name}, what is #{num1} plus #{num2}?"
  ans = num1 + num2
end

def winner(players)
  #byebug
  winner = players.max_by{|p| p.score}
  winner.name
end

# Main program begins

players = []

# create 2 instances of the Player class
# accept user input for name
(0..1).each do |i|
  print "Enter Player #{i+1} name: "
  players[i] = Player.new(gets.chomp)
end

begin
  loop do
    break unless players.each { |player|
      ans = ask(player)
      player_ans = gets.chomp.to_f
      if ans == player_ans
        player.add_score
      else
        player.minus_life
        players.each{|player| player.info}
        break if player.is_dead?
      end
    }
  end

  puts "GAME OVER"
  puts "The winner is: Player #{winner(players)}"
  
  puts "Play again?(y/n)"
  again = gets.chomp == "y"
  
  players.each{|player| player.reset}

end while again