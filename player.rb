class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_guess
    guess = []
    4.times do |num|
      print "Enter guess #{num}: "
      guess.push(gets.chomp)
    end
    guess
  end
end
