# Class definition

class Player 
  attr_reader :name, :score, :num_wins
  #@@all_players = []

  def initialize(name)
    @name = name
    @score = 0
    @life = 3
    @num_wins = 0
   # @@all_players << self
  end

  def info
    puts "#{@name}: Life...#{@life} Score...#{@score}"
  end

  def minus_life
    @life -= 1
  end

  def add_score
    @score += 1
  end

  def is_dead?
    @life == 0
  end

  def incr_win
    @num_wins += 1
  end

  def reset
    @score = 0
    @life = 3    
  end

  # def self.all
  #   @@all_players
  # end
  
  # def self.winner
  #   winner = @@all_players.max_by{|p| @score}
  #   winner.name
  # end

end