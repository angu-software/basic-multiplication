# frozen_string_literal: true

require 'open3'
require 'shellwords'

class CommandRunner
  def initialize(output = $stdout)
    @output = output
  end

  def run(command)
    cmd = Shellwords.split(command)
    Open3.popen2e(*cmd) do |stdin, stdout_err, wait_thr|
      stdin.close
      while (line = stdout_err.gets)
        output.puts line
      end
      status = wait_thr.value
      raise CommandExecError, "Command execution failed: #{command}" unless status.success?
    end
  end

  private attr_reader :output
end

class CommandExecError < StandardError
end
