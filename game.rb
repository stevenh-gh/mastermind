require_relative 'player'
require_relative 'computer'

class Game
  attr_reader :player, :computer
  def initialize
    print 'Enter player name: '
    @player = Player.new gets.chomp
    @computer = Computer.new
  end

  def gameplay
    12.times do |num|
      puts "Round #{num + 1}:"
      if computer.check_guess(player.make_guess)
        win
        break
      end
    end
  end
end
