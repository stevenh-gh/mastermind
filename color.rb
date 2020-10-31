module Color
  private

  COLOR_LIST = %w[red orange yellow green blue purple].freeze

  def generate_random_color
    case rand(1..6)
    when 1 then COLOR_LIST[0]
    when 2 then COLOR_LIST[1]
    when 3 then COLOR_LIST[2]
    when 4 then COLOR_LIST[3]
    when 5 then COLOR_LIST[4]
    when 6 then COLOR_LIST[5]
    end
  end
end
