require 'rspec'
require_relative '../../../app/factory/elements/line'

describe Line do
  let(:drawing_tool) { attributes_for(:drawing_tool) }

  describe '#initialize' do
    context 'incorect initialize data' do
      it 'should raise error' do
        expect { Line.new([1, 'o', 6]) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#draw_on_canvas with horizontal line' do
    let(:line) { Line.new([1, 2, 6, 2]) }

    context 'when canvas exist' do
      let(:canvas_with_line) { line.draw_on_canvas(drawing_tool[:canvas]) }

      it 'return canvas same rows size' do
        expect(canvas_with_line.size).to eq(drawing_tool[:height] + 1)
      end

      it 'return canvas same cols size' do
        expect(canvas_with_line.first.size).to eq(drawing_tool[:width] + 1)
      end

      it 'should contain line colours' do
        [*1..6].each do |x|
          expect(canvas_with_line[2][x]).to eql('X')
        end
      end

      it 'should contain line when convert to str' do
        expect(canvas_with_line[2].join('')).to eql('|XXXXXX              |')
      end

      it 'should have 6 elements' do
        line = canvas_with_line.flatten.select { |elem| elem.eql?('X') }
        expect(line.size).to eq(6)
      end
    end
  end

  describe '#draw_on_canvas with horizontal line from right to left' do
    let(:line) { Line.new([6, 2, 1, 2]) }

    context 'when canvas exist' do
      let(:canvas_with_line) { line.draw_on_canvas(drawing_tool[:canvas]) }

      it 'return canvas same rows size' do
        expect(canvas_with_line.size).to eq(drawing_tool[:height] + 1)
      end

      it 'return canvas same cols size' do
        expect(canvas_with_line.first.size).to eq(drawing_tool[:width] + 1)
      end

      it 'should contain line colours' do
        [*1..6].each do |x|
          expect(canvas_with_line[2][x]).to eql('X')
        end
      end

      it 'should contain line when convert to str' do
        expect(canvas_with_line[2].join('')).to eql('|XXXXXX              |')
      end

      it 'should have 6 elements' do
        line = canvas_with_line.flatten.select { |elem| elem.eql?('X') }
        expect(line.size).to eq(6)
      end
    end
  end

  describe '#draw_on_canvas with vertical line' do
    context 'start or end point out of canvas bounds' do
      let(:line) { Line.new([8, 1, 8, 10]) }
      let(:canvas_with_line) { line.draw_on_canvas(drawing_tool[:canvas]) }

      it 'should raise error' do
        line = canvas_with_line.flatten.select { |elem| elem.eql?('X') }
        expect(line.size).to eq(4)
      end
    end

    let(:line) { Line.new([6, 3, 6, 4]) }
    let(:canvas_with_line) { line.draw_on_canvas(drawing_tool[:canvas]) }

    context 'when canvas exist' do
      it 'return canvas same rows size' do
        expect(canvas_with_line.size).to eq(drawing_tool[:height] + 1)
      end

      it 'return canvas same cols size' do
        expect(canvas_with_line.first.size).to eq(drawing_tool[:width] + 1)
      end

      it 'should contain same colour points as line' do
        expect(canvas_with_line[3].select { |val| val.eql? 'X' }.size).to eq(1)
      end

      it 'should contain line colours' do
        [*3..4].each do |y|
          expect(canvas_with_line[y][6]).to eql('X')
        end
      end

      it 'should contain line when convert to str' do
        expect(canvas_with_line[3].join('')).to eql('|     X              |')
      end

      it 'should have 2 elements' do
        line = canvas_with_line.flatten.select { |elem| elem.eql?('X') }
        expect(line.size).to eq(2)
      end
    end
  end
  describe '#draw_on_canvas' do
    let(:line) { Line.new([1, 2, 6, 2]) }

    context 'when canvas not exist' do
      it 'should raise error' do
        expect { line.draw_on_canvas(nil) }.to raise_error(RuntimeError)
      end
    end
  end
end
