# frozen_string_literal: true

require_relative '../Development_Stage/config'
require_relative '../Development_Stage/development_stage'

describe DevelopmentStage do
  let(:command_runner) { CommandRunner }
  let(:git_info) { GitInfo }
  let(:build_for_testing_command) { DevelopmentStage::Commands::BUILD_FOR_TESTING_COMMAND }
  let(:test_without_building_command) { DevelopmentStage::Commands::TEST_WITHOUT_BUILDING_COMMAND }

  describe '.run' do
    subject { described_class.run }

    before do
      allow(described_class).to receive(:select_xcode).and_call_original
      allow(described_class).to receive(:build_for_testing).and_call_original
      allow(described_class).to receive(:test_without_building).and_call_original
      allow(described_class).to receive(:tag_rc_build).and_call_original

      allow(git_info).to receive(:next_rc_build_tag).and_return('Staged-RC-3')
      allow(git_info).to receive(:git_commit_sha).and_return('ab123')

      allow(command_runner).to receive(:run)
    end

    context 'When executing development statge' do
      before do
        subject
      end

      it 'it exectues all steps sequentially' do
        expect(described_class).to have_received(:select_xcode).ordered
        expect(described_class).to have_received(:build_for_testing).ordered
        expect(described_class).to have_received(:test_without_building).ordered
        expect(described_class).to have_received(:tag_rc_build).ordered
      end

      it 'selects an xcode version' do
        expect(command_runner).to have_received(:run).with("sudo xcode-select -s #{XCODE_PATH}")
      end

      it 'builds for testing' do
        expect(command_runner).to have_received(:run).with(build_for_testing_command)
      end

      it 'tests without building' do
        expect(command_runner).to have_received(:run).with(test_without_building_command)
      end

      context 'when tagging the rc build' do
        it 'it runs the necessary git commands' do
          expect(command_runner).to have_received(:run).with("git tag -a 'Staged-RC-3' -m 'Staged-RC-3' ab123").ordered
          expect(command_runner).to have_received(:run).with("git push origin 'Staged-RC-3'").ordered
        end
      end
    end

    context 'When a command fails' do
      before do
        allow(described_class).to receive(:select_xcode).and_raise(StandardError, 'Something wend wrong')

        subject
      end

      it 'aborts execution' do
        expect(described_class).to_not have_received(:build_for_testing)
      end
    end
  end
end
