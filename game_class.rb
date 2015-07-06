require './player_class'
require './turn_class'

class Game
  def initialize
    @players = []
  end

  def play
    # create 2 instances of the Player class
    # accept user input for name
    get_players
    # byebug
    
    begin
      loop do
        break unless @players.each { |player|
          # byebug
          Turn.new(player).take
          break if player.is_dead?
        }
      end

      puts "GAME OVER"
      puts "The winner is: Player #{winner}"
      
      puts "Play again?(y/n)"
      again = gets.chomp == "y"
      
      @players.each{|player| player.reset}

    end while again

  end

  def get_players
    (0..1).each do |i|
      print "Enter Player #{i+1} name: "
      @players[i] = Player.new(gets.chomp)
    end
  end  

  def winner
    #byebug
    winner = @players.max_by{|p| p.score}
    winner.name
  end

end