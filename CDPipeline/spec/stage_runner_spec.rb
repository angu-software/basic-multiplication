# frozen_string_literal: true

require_relative '../lib/stage_runner'

describe StageRunner do
  let(:output) { StringIO.new }
  let(:stage) { build(:stage, name: 'Stage') }
  let(:step_runner) { instance_double(StepRunner) }

  subject { described_class.new(output).execute_stage(stage) }

  before do
    allow(StepRunner).to receive(:new).and_return(step_runner)
    allow(step_runner).to receive(:execute_step)
  end

  describe 'When running a stage' do
    it 'it prints the stage name' do
      subject
      expect(output.string).to eq("Executing stage: Stage\n")
    end

    it 'it executes the stages steps in order' do
      subject

      expect(step_runner).to have_received(:execute_step).with(stage.steps[0]).ordered
      expect(step_runner).to have_received(:execute_step).with(stage.steps[1]).ordered
    end
  end
end
