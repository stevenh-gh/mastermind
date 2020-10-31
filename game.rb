require_relative 'player'
require_relative 'computer'
require_relative 'color'

class Game
  include Color
  attr_reader :player, :computer

  def initialize
    print 'Enter player name: '
    @player = Player.new gets.chomp
    @computer = Computer.new
  end

  def gameplay
    12.times do |num|
      print_color_list
      puts "Round #{num + 1}:"
      guess = player.make_guess
      response = computer.check_guess(guess)
      print "You guessed: #{guess}\n"
      print "Response: #{response}\n" unless response == win_condition
      if response == win_condition
        declare_win
        break
      end
      print "#{player.name} has failed to decrypt the secret code..." if num == 11
    end
  end

  private

  def print_color_list
    print 'The current list of colors are: '
    COLOR_LIST.each { |color| print "#{color} " }
    puts
  end

  def win_condition
    win_condition = Array.new 4, 'exactly correct'
  end

  def declare_win
    print "#{player.name} has guessed the secret code correctly!"
  end
end
