require_relative 'shape'

# Class represent logic for drawing bucket fill
class BucketFill < Shape
  attr_reader :p_x, :p_y, :colour

  def initialize(args)
    @p_x, @p_y, @colour = args.map { |arg| arg =~ /\D+/im ? arg : arg.to_i }
  end

  private

  def validate!
    args = [p_x, p_y].compact
    raise ArgumentError, "Incorrect args #{args.join(' ')}' for #{self.class.name}" if args.size < 2 || args.find { |arg| arg =~ /\D+/im }
    raise ArgumentError, "No colour for #{self.class.name}" if colour.nil?
  end

  def draw
    raise "Couldn't fill canvas - `#{[p_x, p_y]}` out of bounds" unless point_in_canvas(p_x, p_y)

    fill(p_x, p_y)
  end

  def fill(x, y)
    return if canvas[y][x].eql?(colour) ||
              canvas[y].nil? ||
              canvas[y][x].nil? ||
              REGION_COLORS.include?(canvas[y][x])

    canvas[y][x] = colour

    fill(x - 1, y)
    fill(x + 1, y)
    fill(x, y - 1)
    fill(x, y + 1)
  end
end
