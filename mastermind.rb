require_relative 'game'

class Mastermind
  attr_reader :game
  def initialize
    @game = Game.new
  end

  def play
    play_again = false
    unless play_again
      game.query_mastermind
      legal_answer = false
      until legal_answer
        puts
        print 'Play again? (Y/N): '
        input = gets.chomp.downcase
        legal_answer = true if input == 'y' || input == 'n'
      end
      play_again = true if legal_answer == 'y'
    end
  end
end

m = Mastermind.new
m.play
