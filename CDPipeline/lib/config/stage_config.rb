# frozen_string_literal: true

require 'yaml'

require_relative 'stage'
require_relative 'step'
require_relative 'var_resolver'

class StageConfig
  attr_reader :stage

  def self.load_yaml(config_file)
    new(YAML.load_file(config_file))
  end

  def initialize(config)
    @var_resolver = VarResolver.new(convert_to_hash(config['environment']))
    @stage = build_stage(config['stage'])
  end

  private

  attr_reader :var_resolver

  def build_stage(stage_config)
    stage_name = stage_config['name']
    stage_steps = build_steps(stage_config['steps'])
    Stage.new(name: stage_name, steps: stage_steps)
  end

  def build_steps(steps_config)
    steps_config.map { |step| build_step(step) }
  end

  def build_step(step_config)
    Step.new(name: step_config['name'], command: expand_variables(step_config['command']))
  end

  def expand_variables(command)
    var_resolver.resolve(command)
  end

  def convert_to_hash(yaml_env)
    return {} if yaml_env.nil?

    yaml_env.each_with_object({}) { |env, hash| hash.merge!(env) }
  end
end
