# frozen_string_literal: true

require_relative '../Development_Stage/development_stage'

describe DevelopmentStage do
  describe '.run' do
    subject { described_class.run }

    before do
      allow(described_class).to receive(:select_xcode).and_call_original
      allow(described_class).to receive(:build_for_testing).and_call_original
      allow(described_class).to receive(:test_without_building).and_call_original
      allow(described_class).to receive(:tag_rc_build).and_call_original
      allow(described_class).to receive(:run_command)
    end

    it 'it exectues all steps' do
      subject

      expect(described_class).to have_received(:select_xcode).ordered
      expect(described_class).to have_received(:build_for_testing).ordered
      expect(described_class).to have_received(:test_without_building).ordered
      expect(described_class).to have_received(:tag_rc_build).ordered
    end
  end
end
