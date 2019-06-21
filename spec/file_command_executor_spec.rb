require 'rspec'

require_relative '../app/file_command_executor'

describe FileCommandExecutor do
  let(:input_file_path) { File.expand_path('spec/fixtures/input.txt') }
  let(:output_file_path) { File.expand_path('spec/fixtures/output.txt') }
  let(:file_command_executor) { FileCommandExecutor.new(input_file_path, output_file_path) }

  after(:each) { File.delete(output_file_path) if File.exist?(output_file_path) }

  describe '#perform' do
    let!(:touch_file) { FileUtils.touch(output_file_path) }

    context 'correct input file path' do
      it 'should create output file' do
        file_command_executor.perform
        expect(File.exist?(output_file_path)).to be true
      end

      it 'output file should contain content' do
        file_command_executor.perform
        expect(File.read(output_file_path)).to be_an_kind_of(String)
      end
    end

    context 'incorrect input file path' do
      let(:input_file_path) { '../fixtures/input.txt' }
      let(:file_command_executor) { FileCommandExecutor.new(input_file_path, output_file_path) }

      it 'should raise error' do
        expect { file_command_executor.perform }.to raise_error(RuntimeError)
      end
    end
  end

  describe '#process' do
    let!(:touch_file) { FileUtils.touch(output_file_path) }

    context 'correct file data' do
      it 'should create output file and write to it' do
        file_command_executor.process('C 20 4')
        expect(File.exist?(output_file_path)).to be true
        expect(File.read(output_file_path)).to be_an_kind_of(String)
      end
    end

    context 'incorrect file data' do
      it 'should raise error' do
        expect { file_command_executor.process('C') }.to raise_error
      end
    end
  end

  describe '#write_to_file' do
    context 'image canvas exist' do
      it 'should create output file and write to it' do
        file_command_executor.perform
        file_command_executor.write_to_file
        expect(File.exist?(output_file_path)).to be true
        expect(File.read(output_file_path)).to be_an_kind_of(String)
      end
    end

    context 'image canvas not exist' do
      it 'doesnt create file' do
        file_command_executor.write_to_file
        expect(File.exist?(output_file_path)).to be false
      end
    end
  end
end
