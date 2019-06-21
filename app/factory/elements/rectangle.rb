require_relative 'shape'

# Class represent logic for drawing rectangle

class Rectangle < Shape
  attr_reader :x1, :y1, :x2, :y2

  def initialize(args)
    @x1, @y1, @x2, @y2 = args.map { |arg| arg =~ /\D+/im ? arg : arg.to_i }
    validate!
  end

  private

  def validate!
    args = [x1, y1, x2, y2].compact
    raise ArgumentError, "Incorrect args #{args.join(' ')}' for #{self.class.name}" if args.size < 4 || args.find { |arg| arg =~ /\D+/im }
  end

  def draw
    (y1..y2).to_a.each(&method(:draw_rows))
  end

  def draw_rows(y)
    (x1..x2).to_a.select { |x| point_in_canvas(x, y) }.each { |x| draw_border(x, y) }
  end

  def draw_border(x, y)
    canvas[y][x] = RECTANGLE_COLOR if [y1, y2].include?(y) ||
                                      [x1, x2].include?(x)
  end
end
