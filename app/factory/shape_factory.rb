require_relative 'elements/line'
require_relative 'elements/bucket_fill'
require_relative 'elements/rectangle'
require_relative 'elements/frame'

# Class represent factory logic for selecting
# correct shape for incoming command
class ShapeFactory
  def self.build(shape, args)
    case shape.upcase
    when 'C'
      Frame.new(args)
    when 'L'
      Line.new(args)
    when 'R'
      Rectangle.new(args)
    when 'B'
      BucketFill.new(args)
    else
      raise 'Command not found'
    end
  end
end
