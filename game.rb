require './player'
require './turn'
require "./exceptions"

class Game
  def initialize(players)
    @players = players
  end

  def play
    # ask players questions until one is 'dead'
    loop do
      # loop through the players
      break unless @players.each { |player|
        # byebug
        Turn.new(player).take
        break if player.is_dead?
      }
    end
    game_over
  end

  private
  
  def game_over
    puts "GAME OVER"
    @players.each{|p| p.info}
    puts "The winner is: Player #{winner}"
    @players.each{|player| player.reset}
  end

  def winner
    #byebug
    winner = @players.max_by{|p| p.score}
    winner.incr_win
    return winner.name
  end

end