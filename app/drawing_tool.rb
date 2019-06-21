require_relative 'factory/elements/shape'

# Class represent logic for drawing content on canvas
# and converting canvas content to string

class DrawingTool
  attr_reader :canvas

  def draw(shape = Shape.new)
    @canvas = shape.draw_on_canvas(canvas)
  end

  def to_s
    canvas&.map { |row| row.join('') }&.join("\n")&.concat("\n\n")
  end
end
