require_relative 'shape'

# Class represent logic for drawing frame

class Frame < Shape
  attr_reader :width, :height

  # Increment @width and @height to 1 for bottom and letf borders.
  # Right and top border containing 0 coordinat

  def initialize(args)
    @width, @height = args.map { |arg| arg =~ /\D+/im ? arg : arg.to_i + 1 }
    validate!
  end

  def draw_on_canvas(_canvas)
    super((0..height).map { (0..width).map { ' ' } })
  end

  private

  def validate!
    args = [width, height].compact
    raise ArgumentError, "Incorrect args #{args.join(' ')}' for #{self.class.name}" if args.size < 2 || args.find { |arg| arg =~ /\D+/im }
  end

  def colour(x, y)
    return FRAME_FIRST_COLOR if [0, height].include?(y)
    return FRAME_SECOND_COLOR if [0, width].include?(x)

    FRAME_THIRD_COLOR
  end

  def draw
    (0..height).to_a.each do |y|
      (0..width).to_a.each do |x|
        canvas[y][x] = colour(x, y)
      end
    end
  end
end
