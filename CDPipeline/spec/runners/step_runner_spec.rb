# frozen_string_literal: true

require_relative '../../lib/runners/step_runner'

describe StepRunner do
  let(:output) { StringIO.new }
  let(:step) do
    build(:step, name: 'Step',
                 command: 'echo Hello World')
  end
  let(:command_runner) { instance_double(CommandRunner) }
  subject { described_class.new(output).execute_step(step) }

  before do
    allow(CommandRunner).to receive(:new).and_return(command_runner)
    allow(command_runner).to receive(:run)
  end

  describe 'When executing a step' do
    it 'it prints the step name' do
      subject

      expect(output.string).to eq("Executing step: Step\n")
    end

    it 'exectutest the commens' do
      subject

      expect(command_runner).to have_received(:run).with(step.command)
    end
  end
end
