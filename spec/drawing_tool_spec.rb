require 'rspec'
require_relative '../app/drawing_tool'
require_relative '../app/factory/shape_factory'

describe DrawingTool do
  let(:img) { DrawingTool.new }

  describe '#draw' do
    context "with shape and shape don't need canvas" do
      let(:frame) { ShapeFactory.build('C', [20, 4]) }

      it 'should return array or array' do
        expect(img.draw(frame)).to  all(be_an_kind_of(Array))
      end
    end

    context 'when shape and canvas exist and shape need canvas' do
      let(:frame) { ShapeFactory.build('C', [20, 4]) }
      let(:line) { ShapeFactory.build('L', [1, 2, 6, 2]) }

      it 'should return array or array' do
        img.draw(frame)

        expect(img.draw(line)).to all(be_an_kind_of(Array))
      end
    end

    context 'when shape exist and need canvas and canvas nil' do
      let(:line) { ShapeFactory.build('L', [1, 2, 6, 2]) }

      it 'should raise error' do
        expect { img.draw(line) }.to raise_error(RuntimeError)
      end
    end

    context 'without shape and canvas not exist' do
      it 'should raise error' do
        expect { img.draw }.to raise_error(RuntimeError)
      end
    end

    context 'without shape and canvas exist' do
      it 'should raise error' do
        expect { img.draw }.to raise_error(RuntimeError)
      end
    end
  end

  describe '#to_s' do
    context 'when canvas exist' do
      let(:frame) { ShapeFactory.build('C', [20, 4]) }

      it 'should return string' do
        img.draw(frame)
        expect(img.to_s).to be_a_kind_of(String)
      end
    end

    context 'when canvas not exist' do
      it 'should return nil' do
        expect(img.to_s).to be_nil
      end
    end
  end
end
