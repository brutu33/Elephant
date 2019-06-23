require_relative '../constants'

# Class represent base logic for shapes

class Shape
  include Constants

  attr_reader :canvas

  def draw_on_canvas(canvas)
    raise "#{self.class.name} cannot be drawn without canvas" if canvas.nil?

    @canvas = canvas
    draw
    @canvas
  end

  private

  def validate!
    raise NotImplementedError
  end

  def draw
    raise NotImplementedError
  end

  # detect if drawing area include point

  def point_in_canvas(x, y)
    [*1..canvas.size - 2].include?(y) && [*1..canvas.first.size - 2].include?(x)
  end
end
