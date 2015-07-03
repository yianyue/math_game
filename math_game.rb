#create an array of hashes, each hash stores the info of a player
#and initialize the life and score

@players = [
  { id: 1,
    life: 3,
    score: 0
  },
  {
    id: 2,
    life: 3,
    score: 0
  }
]

# is this really a good way to structure the program?
# if the random numbers are generated inside the ask function, 
# the answer will either need to be returned, or passed to the verify function

def restart
  @players.each{|player| 
    player[:life] = 3
    player[:score] = 0
  }
end

def ask(player)
  num1 = rand(1..20)
  num2 = rand(1..20)
  puts "Player #{player[:id]}, what is #{num1} plus #{num2}?"
  ans = num1 + num2
end

def get_answer()
  #get user input, remove return character, and convert to a float
  input = gets.chomp.to_f
end

# they are all 1 line functions, used once in the loop...
# are they necessary?
def right?(ans, player_ans)
  ans == player_ans
end

def minus_life(player)
  player[:life] -= 1
end

def add_score(player)
  player[:score] += 1
end

def display_player_info()
  @players.each{|player|
    puts "Player #{player[:id]}: Life #{player[:life]} Score #{player[:score]}"
  }
end

def dead?(player)
  player[:life] == 0
end

def winner
  winner = @players.max_by{|p| p[:score]}
  winner[:id]
end

begin
 
  loop do
    break unless @players.each { |player|
      ans = ask(player)
      player_ans = get_answer()
      if right?(ans, player_ans)
        add_score(player)
      else
        minus_life(player)
        display_player_info
        break if dead?(player)
      end
    }
  end

  puts "GAME OVER"
  puts "The winner is: Player #{winner}"

  puts "Play again?(y/n)"
  again = gets.chomp == "y"
  restart

end while again