require_relative 'color'

class Computer
  include Color
  attr_reader :code

  def initialize
    @code = random_color_array
  end

  private

  def random_color_array
    color_array = Array.new(4)
    color_array.each_index do |idx|
      color_not_exist = false
      until color_not_exist
        color = generate_random_color
        unless color_array.include? color
          color_not_exist = true
          color_array[idx] = color
        end
      end
    end
    color_array
  end
end

c = Computer.new
p c.code
