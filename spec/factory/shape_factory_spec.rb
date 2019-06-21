require 'rspec'
require_relative '../../app/factory/shape_factory'

require_relative '../../app/factory/elements/line'
require_relative '../../app/factory/elements/bucket_fill'
require_relative '../../app/factory/elements/rectangle'
require_relative '../../app/factory/elements/frame'

describe ShapeFactory do
  describe '#build' do
    context 'frame' do
      let(:frame) { ShapeFactory.build('C', [20, 4]) }
      it 'should return instance of frame' do
        expect(frame).to be_a_kind_of(Frame)
      end

      it 'should have correct values' do
        expect(frame.width).to eq(21)
        expect(frame.height).to eq(5)
      end
    end

    context 'line' do
      let(:line) { ShapeFactory.build('L', [1, 2, 6, 2]) }

      it 'should return instance of line' do
        expect(line).to be_a_kind_of(Line)
      end

      it 'should have correct values' do
        expect(line.x1).to eq(1)
        expect(line.y1).to eq(2)
        expect(line.x2).to eq(6)
        expect(line.y2).to eq(2)
      end
    end

    context 'rectangle' do
      let(:rectangle) { ShapeFactory.build('R', [16, 1, 20, 3]) }

      it 'should return instance of rectangle' do
        expect(rectangle).to be_a_kind_of(Rectangle)
      end

      it 'should have correct values' do
        expect(rectangle.x1).to eq(16)
        expect(rectangle.y1).to eq(1)
        expect(rectangle.x2).to eq(20)
        expect(rectangle.y2).to eq(3)
      end
    end

    context 'bucket_fill' do
      let(:bucket_fill) { ShapeFactory.build('B', [10, 3, 'o']) }

      it 'should return instance of bucket_fill' do
        expect(bucket_fill).to be_a_kind_of(BucketFill)
      end

      it 'should have correct values' do
        expect(bucket_fill.p_x).to eq(10)
        expect(bucket_fill.p_y).to eq(3)
        expect(bucket_fill.colour).to eql('o')
      end
    end
  end
end
