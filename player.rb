require_relative 'color'

class Player
  include Color
  attr_reader :name, :code

  def initialize(name)
    @name = name
  end

  def make_code
    @code = []
    4.times do |num|
      print_color_list
      legal_input = false
      until legal_input
        print "Enter color #{num + 1}: "
        color = gets.chomp.downcase
        if COLOR_LIST.include? color
          @code.push color
          legal_input = true
        end
      end
    end
    @code
  end

  def make_guess
    guess = []
    4.times do |num|
      legal_input = false
      until legal_input
        print "Enter guess #{num + 1}: "
        input = gets.chomp.downcase
        if COLOR_LIST.include? input
          guess.push input
          legal_input = true
        end
      end
    end
    guess
  end
end
