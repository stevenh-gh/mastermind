require_relative 'color'

class Player
  include Color
  attr_reader :name, :code

  def initialize(name)
    @name = name
  end

  def check_guess(guess)
    response = []
    guess.each_with_index do |color, idx|
      legal_choice = false
      until legal_choice
        puts "Your code: #{code}"
        puts "1. exactly correct\n2. correct color\n3. incorrect"
        puts "Color \##{idx + 1}: #{color}"
        puts
        choice = gets.chomp
        if %w[1 2 3].include? choice
          response.push response_choice choice.to_i unless choice == '3'
          legal_choice = true
        end
      end
    end
    response
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

  private

  def response_choice(choice)
    case choice
    when 1 then 'exactly correct'
    when 2 then 'correct color'
    end
  end
end
