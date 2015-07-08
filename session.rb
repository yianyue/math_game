#instance of a session class incorporates multiple games
require './game'
require './player'
require './exceptions'

class Session
  NUMPLAYERS = 2
  def initialize
    @players = []
  end

  def run
    get_players

    begin
      Game.new(@players).play
      puts "Play again?(y/n)"
      again = gets.chomp == "y"
    end while again
    
    end_session
  end

  private

  def get_players
    # 3 dots for exclusive range
    (0...NUMPLAYERS).each do |i|
      begin
        print "Enter Player #{i+1} name: "
        name = gets.chomp
        raise InvalidNameError if name =~ /^\s*$/
        @players[i] = Player.new(name)
      rescue InvalidNameError
        puts "invalid name"
        retry
      end
      
    end
  end  

  def winner
    #byebug
    winner = @players.max_by{|p| p.num_wins}
    winner.name
  end
  
  def end_session
    puts "SESSION OVER"
    @players.each{|p| puts "#{p.name} has #{p.num_wins} wins"}
    puts "The overall winner is: Player #{winner}"
  end

end