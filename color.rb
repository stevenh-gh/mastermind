module Color
  private

  COLOR_LIST = %w[red orange yellow green blue purple].freeze

  def print_color_list
    print 'The current list of colors are: '
    COLOR_LIST.each { |color| print "#{color} " }
    puts
  end

  def generate_random_color
    COLOR_LIST[rand(1..COLOR_LIST.length) - 1]
  end
end
