require_relative 'player'
require_relative 'computer'

class Game
  def initialize
    print 'Enter player name: '
    player = Player.new gets.chomp
    computer = Computer.new
  end
end
