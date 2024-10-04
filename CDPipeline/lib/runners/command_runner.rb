# frozen_string_literal: true

require 'open3'
require 'shellwords'

class CommandRunner
  def self.run(command, output = $stdout)
    new(output).run(command)
  end

  def self.run_and_return_output(command)
    output = StringIO.new
    new(output).run(command)
    output.string
  end

  def initialize(output = $stdout)
    @output = output
  end

  def run(command)
    cmd = Shellwords.split(command)
    Open3.popen2e(*cmd) do |stdin, stdout_err, wait_thr|
      stdin.close
      while (line = stdout_err.gets)
        output.puts line # TODO: only in verbose mode
      end
      status = wait_thr.value
      raise CommandExecError, "Command execution failed: #{command}" unless status.success?
    end
  end

  private attr_reader :output
end

class CommandExecError < StandardError
end
