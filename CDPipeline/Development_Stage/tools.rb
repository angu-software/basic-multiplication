# frozen_string_literal: true

require_relative '../lib/runners/command_runner'

def self.run_command(command)
  CommandRunner.run(command)
rescue StandardError => e
  puts "Error: #{e}"
end
