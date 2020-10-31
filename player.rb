require_relative 'color'

class Player
  include Color
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_guess
    guess = []
    4.times do |num|
      legal_input = false
      until legal_input
        print "Enter guess #{num + 1}: "
        input = gets.chomp
        if COLOR_LIST.include? input
          guess.push(input)
          legal_input = true
        end
      end
    end
    guess
  end
end
