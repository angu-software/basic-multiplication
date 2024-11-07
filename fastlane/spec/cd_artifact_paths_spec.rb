# frozen_string_literal: true

require_relative '../lib/cd_artifact_paths'

describe CDArtifactPaths do
  describe 'when specifying a stage' do
    let(:stage) { CD_STAGES[:DEV] }
    subject { described_class.new(stage, 'build_result') }

    it 'it specifies the derived data path in the build directoy' do
      expect(subject.derived_data_path).to eq('.jabos/derived_data')
    end

    it 'it specifies the result bundle in stage directoy' do
      expect(subject.result_bundle_path('testing_build')).to eq('.jabos/dev_stage/build_result/testing_build.xcresult')
    end

    it 'it specifies the output directory in stage directoy' do
      expect(subject.output_directory).to eq('.jabos/dev_stage/build_result')
    end

    it 'it specifies the buildlog path directory in stage directoy' do
      expect(subject.buildlog_path).to eq(subject.output_directory)
    end
  end
end
