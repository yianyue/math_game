# Class definition

class Player 
  attr_reader :name

  @@all_players = []

  def initialize(name)
    @name = name
    @score = 0
    @life = 3
    @@all_players << self
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

  def self.all
    @@all_players
  end
  
  def self.winner
    winner = @@all_players.max_by{|p| @score}
    winner.name
  end

end