# frozen_string_literal: true

require 'yaml'

require_relative '../lib/config/stage_config'
require_relative '../lib/config/stage'

describe 'StageConfig' do
  let(:yml_file) { 'dev_stage.yml' }
  let(:yml_path) { File.join(File.dirname(__FILE__), 'fixtures', 'spec_config', yml_file) }
  subject { StageConfig.new(YAML.load_file(yml_path)) }

  context 'When given a configuration' do
    it 'it parses the stage content' do
      expect(subject.stage).to eq(build(:stage))
    end
  end

  # TODO: specs
  # - parse environment variables
  # - expand variables ${VAR} and $VAR
  # - raise an error if the stage is not specified
  # - ignore steps without command
  # - use command as name if name is not specified
end
