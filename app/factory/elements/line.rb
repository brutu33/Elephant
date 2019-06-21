require_relative 'shape'

# Class represent logic for drawing line

class Line < Shape
  attr_reader :x1, :y1, :x2, :y2

  def initialize(args)
    @x1, @y1, @x2, @y2 = args.map { |arg| arg =~ /\D+/im ? arg : arg.to_i }
    validate!
  end

  def validate!
    args = [x1, y1, x2, y2].compact
    raise ArgumentError, "Incorrect args '#{args.join(' ')}' for #{self.class.name}" if args.size < 4 || args.find { |arg| arg =~ /\D+/im }
  end

  private

  def draw
    draw_vertical_line if x1 == x2
    draw_horizontal_line if y1 == y2
  end

  def draw_vertical_line
    (y1..y2).to_a.select { |y| point_in_canvas(x1, y) }.each { |y| canvas[y][x1] = LINE_COLOR }
  end

  def draw_horizontal_line
    (x1..x2).to_a.select { |x| point_in_canvas(x, y1) }.each { |x| canvas[y1][x] = LINE_COLOR }
  end
end
