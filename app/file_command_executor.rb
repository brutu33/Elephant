require_relative 'factory/shape_factory'
require_relative 'drawing_tool'

# Class represent logic for reading drawing commands from file
# execute them and write result to file
class FileCommandExecutor
  attr_reader :read_file_name, :write_file_name, :drawing_tool

  def initialize(read_file_name, write_file_name)
    @read_file_name = read_file_name
    @write_file_name = write_file_name
    @drawing_tool = DrawingTool.new
  end

  def perform
    raise "Couldn't find file on path #{read_file_name}" unless File.exist?(read_file_name)

    # clear output file
    File.truncate(write_file_name, 0) if File.exist?(write_file_name)
    File.foreach(read_file_name, &method(:process))
  end

  def process(line)
    shape, *args = line.split(/\s+/im)
    raise 'Incorrect file data' unless shape || args&.size > 0

    drawing_tool.draw(ShapeFactory.build(shape, args))
    write_to_file
  end

  def write_to_file
    File.open(write_file_name, 'a') {|f| f.write(drawing_tool.to_s)} if drawing_tool.canvas
  end
end
