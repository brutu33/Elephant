require 'rspec'
require_relative '../../../app/factory/elements/shape'

describe Shape do
  let(:drawing_tool) { attributes_for(:drawing_tool) }
  let(:shape) { Shape.new }

  describe '#draw_on_canvas' do
    context 'when canvas exist' do
      it 'should raise error' do
        expect { shape.draw_on_canvas(drawing_tool[:canvas]) }.to raise_error(NotImplementedError)
      end
    end

    context 'when canvas not exist' do
      it 'should raise error' do
        expect { shape.draw_on_canvas(nil) }.to raise_error(RuntimeError)
      end
    end
  end
end
