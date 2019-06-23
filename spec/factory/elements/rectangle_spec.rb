require 'rspec'
require_relative '../../../app/factory/elements/rectangle'

describe Rectangle do
  let(:drawing_tool) { attributes_for(:drawing_tool) }

  describe '#initialize' do

  end

  describe '#draw_on_canvas' do
    context 'with incorect initialize data' do
      let(:rectangle) { Rectangle.new([1, 'o', 6]) }
      it 'should raise error' do
        expect { rectangle.draw_on_canvas(drawing_tool[:canvas]) }.to raise_error(ArgumentError)
      end
    end

    context 'start or end point out of canvas bounds' do
      let(:rectangle) { Rectangle.new([10, 0, 14, 2]) }
      let(:canvas_with_rect) { rectangle.draw_on_canvas(drawing_tool[:canvas]) }

      it 'should raise error' do
        line = canvas_with_rect.flatten.select { |elem| elem.eql?('X') }
        expect(line.size).to eq(7)
      end
    end

    let(:rectangle) { Rectangle.new([16, 1, 20, 3]) }
    let(:canvas_with_rectangle) { rectangle.draw_on_canvas(drawing_tool[:canvas]) }

    context 'when canvas exist' do
      it 'return canvas same rows size' do
        expect(canvas_with_rectangle.size).to eq(6)
      end

      it 'return canvas same cols size' do
        expect(canvas_with_rectangle.first.size).to eq(22)
      end

      it 'should have 12 border elements' do
        borders = canvas_with_rectangle.flatten.select { |elem| elem.eql?('X') }
        expect(borders.size).to eq(12)
      end
    end

    context 'when canvas not exist' do
      it 'should raise error' do
        expect { rectangle.draw_on_canvas(nil) }.to raise_error(RuntimeError)
      end
    end
  end

  describe '#draw_on_canvas when x1 > x2' do
    context 'start or end point out of canvas bounds' do
      let(:rectangle) { Rectangle.new([14, 2, 10, 0]) }
      let(:canvas_with_rect) { rectangle.draw_on_canvas(drawing_tool[:canvas]) }

      it 'should raise error' do
        line = canvas_with_rect.flatten.select { |elem| elem.eql?('X') }
        expect(line.size).to eq(7)
      end
    end

    let(:rectangle) { Rectangle.new([16, 1, 20, 3]) }
    let(:canvas_with_rectangle) { rectangle.draw_on_canvas(drawing_tool[:canvas]) }

    context 'when canvas exist' do
      it 'return canvas same rows size' do
        expect(canvas_with_rectangle.size).to eq(6)
      end

      it 'return canvas same cols size' do
        expect(canvas_with_rectangle.first.size).to eq(22)
      end

      it 'should have 12 border elements' do
        borders = canvas_with_rectangle.flatten.select { |elem| elem.eql?('X') }
        expect(borders.size).to eq(12)
      end
    end

    context 'when canvas not exist' do
      it 'should raise error' do
        expect { rectangle.draw_on_canvas(nil) }.to raise_error(RuntimeError)
      end
    end
  end
end
