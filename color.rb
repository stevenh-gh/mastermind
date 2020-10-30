module Color
  private

  def generate_random_color
    case rand(1..6)
    when 1 then 'red'
    when 2 then 'orange'
    when 3 then 'yellow'
    when 4 then 'green'
    when 5 then 'blue'
    when 6 then 'purple'
    end
  end
end
