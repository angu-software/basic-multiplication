# frozen_string_literal: true

require_relative 'config'

def self.select_xcode
  puts "Select Xcode: #{XCODE_PATH}"
  run_command("sudo xcode-select -s #{XCODE_PATH}")
end

select_xcode if __FILE__ == $PROGRAM_NAME
