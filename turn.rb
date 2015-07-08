require "./exceptions"

class Turn

  def initialize(player)
    @player = player
    @ans = nil
    @player_ans = nil
  end

  def take
    ask

    @player_ans = gets.chomp.to_f
    # string.to_f returns 0.0
    raise InvalidGuessError if @player_ans == 0

    if @ans == @player_ans
      @player.add_score
    else
      @player.minus_life
      @player.info  
    end
    #TODO: better way to use the custom InvalidGuessError class?
  rescue InvalidGuessError => error
    puts error.message
    take
  end
  
  def ask
    num1 = rand(1..20)
    num2 = rand(1..20)
    puts "Player #{@player.name}, what is #{num1} plus #{num2}?"
    @ans = num1 + num2
  end


end