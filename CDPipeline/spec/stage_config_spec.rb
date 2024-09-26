# frozen_string_literal: true

require 'yaml'

require_relative '../lib/config/stage_config'
require_relative '../lib/config/stage'

describe 'StageConfig' do
  let(:yml_file) { 'dev_stage.yml' }
  let(:yml_path) { File.join(File.dirname(__FILE__), 'fixtures', 'spec_config', yml_file) }
  subject { StageConfig.load_yaml(yml_path) }

  context 'When given a configuration' do
    it 'it parses the stage content' do
      expect(subject.stage).to eq(build(:stage))
    end
  end

  context 'When the yaml specifies environment variables' do
    let(:yml_file) { 'dev_stage_env_node.yml' }

    it 'it parses the environment variables' do
      expect(subject.environment).to eq([
        { "XCODE" => "/Applications/Xcode_16.app" },
        { "SCHEME" => "Basic Multiplication" },
        { "TEST_PLAN" => "DevelopmentTests" },
        { "DESTINATION" => "platform=iOS Simulator,name=iPhone 16 Pro" },
        { "ARGUMENTS" => '-scheme "$SCHEME" -testPlan "$TEST_PLAN" -destination "$DESTINATION"' }
      ])
    end

    it 'it expands the variables in a command' do
      expect(subject.stage.steps[0].command).to eq('sudo xcode-select -s /Applications/Xcode_16.app')
    end

    it 'it expands the variables in a command recusively' do
      expect(subject.stage.steps[1].command).to eq('xcodebuild build-for-testing -scheme "Basic Multiplication" -testPlan "DevelopmentTests" -destination "platform=iOS Simulator,name=iPhone 16 Pro"')
    end
  end

  # TODO: specs
  # - raise an error if the stage is not specified
  # - raise an error when step has no command
  # - use command as name if name is not specified
end
