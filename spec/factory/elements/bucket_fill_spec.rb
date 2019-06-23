require 'rspec'
require_relative '../../../app/factory/elements/bucket_fill'

describe BucketFill do
  let(:drawing_tool) { attributes_for(:drawing_tool) }

  describe '#draw_on_canvas' do

    context 'point out of canvas bounds' do
      let(:bucket_fill) { BucketFill.new([32, 9, 'o']) }

      it 'should raise error' do
        expect { bucket_fill.draw_on_canvas(drawing_tool[:canvas]) }.to raise_error(RuntimeError)
      end
    end

    let(:bucket_fill) { BucketFill.new([10, 3, 'o']) }
    context 'when canvas exist' do
      let(:canvas_with_bucket_fill) { bucket_fill.draw_on_canvas(drawing_tool[:canvas]) }

      it 'return canvas same rows size + 2' do
        expect(canvas_with_bucket_fill.size).to eq(6)
      end

      it 'return canvas same cols size + 2' do
        expect(canvas_with_bucket_fill.first.size).to eq(22)
      end

      it 'should have 2 elements' do
        bucket_fill = canvas_with_bucket_fill.flatten.select { |elem| elem.eql?('o') }
        expect(bucket_fill.size).to eq(80)
      end
    end

    context 'when canvas not exist' do
      it 'should raise error' do
        expect { bucket_fill.draw_on_canvas(nil) }.to raise_error(RuntimeError)
      end
    end

    context 'with incorect initialize data' do
      let(:bucket_fill) { BucketFill.new(['a', 9, 'o']) }

      it 'should raise error' do
        expect { bucket_fill.draw_on_canvas(drawing_tool[:canvas]) }.to raise_error(ArgumentError)
      end
    end
  end
end
