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
def verify(ans, player_ans)
  ans == player_ans
end

def minus_life(player)
  player[:life] -= 1
end

def add_score(player)
  player[:score] += 1
end

def display_player_info(player)
  puts "Player #{player[:id]}: Life #{player[:life]} Score #{player[:score]}"
end

@players.each { |player|
  ans = ask(player)
  player_ans = get_answer()
  if verify(ans, player_ans)
    add_score(player)
  else
    minus_life(player)
  end
  display_player_info(player)
}
