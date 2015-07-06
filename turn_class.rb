require './player_class'

class Turn

  def initialize(player)
    @player = player
  end

  def take
    ans = ask
    player_ans = gets.chomp.to_f
    if ans == player_ans
      @player.add_score
    else
      @player.minus_life
      @player.info  
    end
  end
  
  def ask
    num1 = rand(1..20)
    num2 = rand(1..20)
    puts "Player #{@player.name}, what is #{num1} plus #{num2}?"
    ans = num1 + num2
  end

end