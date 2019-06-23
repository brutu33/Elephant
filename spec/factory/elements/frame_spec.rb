require 'rspec'
require_relative '../../../app/factory/elements/frame'
require_relative './../../factories/drawing_tool'

describe Frame do
  describe '#initialize' do

  end



  describe '#draw_on_canvas' do


    context 'with incorect initialize data' do
      let(:frame) { Frame.new([20]) }
      it 'should raise error' do
        expect { frame.draw_on_canvas(nil) }.to raise_error(ArgumentError)
      end
    end

    let(:frame) { Frame.new([20, 4]) }
    let(:canvas_with_frame) { frame.draw_on_canvas(nil) }

    it 'return canvas same rows size + 2' do
      expect(canvas_with_frame.size).to eq(6)
    end

    it 'return canvas same cols size + 2' do
      expect(canvas_with_frame.first.size).to eq(22)
    end

    it 'should have top and bottom borders full of "-" colour' do
      expect(canvas_with_frame.first + canvas_with_frame.last).to all(match('-'))
    end

    it 'should have left and right borders full of "|" colour' do
      elements = [*1..4].map do |y|
        row = canvas_with_frame[y]
        [row.first] + [row.last]
      end.flatten
      expect(elements).to all(match('|'))
    end
  end
end
