# frozen_string_literal: true

require_relative '../lib/command_runner'

describe CommandRunner do
  let(:output) { StringIO.new }
  let(:exitCode) { 0 }
  let(:cmd_output) { '>&2 echo "Error 1"' }
  let(:command) do
    <<~COMMAND
      #{cmd_output}
      exit #{exitCode}
    COMMAND
  end
  subject { described_class.new(output).run(command) }

  context 'When runing a command' do
    context 'When the command fails' do
      let(:exitCode) { 1 }

      it 'throws an error' do
        expect { subject }.to raise_error(CommandExecError, "Command execution failed: #{command}")
      end

      it 'prints the commands error' do
        begin
          subject
        rescue StandardError
          nil
        end
        expect(output.string).to eq("Error 1\n")
      end
    end

    context 'When the command succeeds' do
      let(:exitCode) { 0 }
      let(:cmd_output) { 'echo Hello' }

      it 'it prints the commands output' do
        subject
        expect(output.string).to eq("Hello\n")
      end
    end
  end
end
