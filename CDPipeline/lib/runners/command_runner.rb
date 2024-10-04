# frozen_string_literal: true

require 'open3'
require 'shellwords'

class CommandRunner
  def self.run(command, output = $stdout)
    new(output).run(command)
  end

  def self.run_and_return_output(command)
    output = StringIO.new
    begin
      new(output).run(command)
      output.string # TODO: strip
    rescue StandardError
      raise CommandExecError.new(command:, err_output: output.string)
    end
  end

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
      raise CommandExecError.new(command:) unless status.success?
    end
  end

  private attr_reader :output
end

class CommandExecError < StandardError
  def initialize(command:, err_output: nil)
    err_output ||= ''
    msg = "Command '#{command}' failed"
    msg += " with '#{err_output.strip}'" unless err_output.empty?
    super(msg)
  end
end
