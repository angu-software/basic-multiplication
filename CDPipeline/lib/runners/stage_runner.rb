# frozen_string_literal: true

require_relative '../config/stage'
require_relative 'step_runner'

class StageRunner
  def initialize(output = $stdout)
    @output = output
    @step_runner = StepRunner.new(output)
  end

  def execute_stage(stage)
    output.puts "Executing stage: #{stage.name}"
    stage.steps.each do |step|
      step_runner.execute_step(step)
    end
  end

  private

  attr_reader :output, :step_runner
end
