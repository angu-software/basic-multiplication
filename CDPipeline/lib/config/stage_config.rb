# frozen_string_literal: true

require 'yaml'

require_relative 'stage'
require_relative 'step'
require_relative 'var_resolver'

class StageConfig
  attr_reader :stage
  attr_reader :environment

  def self.load_yaml(config_file)
    new(YAML.load_file(config_file))
  end

  def initialize(config)
    @environment = config['environment']
    @stage = build_stage(config['stage'])
  end

  private

  def build_stage(stage_config)
    stage_name = stage_config['name']
    stage_steps = build_steps(stage_config['steps'])
    Stage.new(name: stage_name, steps: stage_steps)
  end

  def build_steps(steps_config)
    steps_config.map { |step| build_step(step) }
  end

  def build_step(step_config)
    command = expand_variables(step_config['command'])
    Step.new(name: step_config['name'], command: command)
  end

  def expand_variables(command)
    VarResolver.resolve(command, environment)
  end
end
