require_relative 'player'
require_relative 'computer'
require_relative 'color'

class Game
  include Color
  attr_reader :player, :computer
  NUM_ROUNDS = 12

  def initialize
    print 'Enter player name: '
    @player = Player.new gets.chomp
    @computer = Computer.new
  end

  def query_mastermind
    legal_answer = false
    input = ''
    until legal_answer
      print "Does #{player.name} want to be the mastermind? (Y/N): "
      input = gets.chomp.downcase
      legal_answer = true if input == 'y' || input == 'n'
    end
    input == 'n' ? gameplay_computer_mastermind : gameplay_player_mastermind
  end

  def gameplay_player_mastermind
    code = player.make_code
    NUM_ROUNDS.times do |num|
      puts "Round #{num + 1} of #{NUM_ROUNDS}"
      guess = computer.make_guess
      puts "Guess: #{guess}"
      response = player.check_guess(guess)
      puts "Response: #{response}"
    end
  end

  private

  def gameplay_computer_mastermind
    NUM_ROUNDS.times do |num|
      2.times { puts } if num > 0
      print_color_list
      puts
      puts "Round #{num + 1} of #{NUM_ROUNDS}:"
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

  def win_condition
    win_condition = Array.new 4, 'exactly correct'
  end

  def declare_win
    print "#{player.name} has guessed the secret code correctly!"
  end
end
