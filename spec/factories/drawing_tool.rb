require_relative '../../app/drawing_tool'

FactoryBot.define do
  factory :drawing_tool do
    width { 21 }
    height { 5 }
    canvas do
      (0..height).to_a.map do |y|
        (0..width).to_a.map do |x|
          next '-' if [0, height].include?(y)
          next '|' if [0, width].include?(x)

          ' '
        end
      end
    end
  end
end
