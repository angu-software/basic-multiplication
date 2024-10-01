# frozen_string_literal: true

require_relative '../config/step'
require_relative 'command_runner'

class StepRunner
  def initialize(output = $stdout)
    @output = output
    @command_runner = CommandRunner.new(output)
  end

  def execute_step(step)
    output.puts "Executing step: #{step.name}"
    command_runner.run(step.command)
  end

  private

  attr_reader :output, :command_runner
end
