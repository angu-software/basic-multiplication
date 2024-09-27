# frozen_string_literal: true

require 'open3'

class CommandRunner
  def initialize(output = $stdout)
    @output = output
  end

  def run(command)
    Open3.popen2e(command) do |stdin, stdout_err, wait_thr|
      stdin.close
      output.puts stdout_err.read
      status = wait_thr.value
      raise CommandExecError, "Command execution failed: #{command}" unless status.success?
    end
  end

  private attr_reader :output
end

class CommandExecError < StandardError
end
