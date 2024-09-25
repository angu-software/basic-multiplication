# frozen_string_literal: true

require_relative 'stage'
require_relative 'step'

class StageConfig
  attr_reader :stage

  def initialize(config)
    @stage = build_stage(config['stage'])
    @environment = config['environment']
  end

  private
  
  attr_reader :environment

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
    Step.new(name: step_config['name'], command: step_config['command'])
  end
end
