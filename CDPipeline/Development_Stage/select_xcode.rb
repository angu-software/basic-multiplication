# frozen_string_literal: true

require_relative 'config'

puts "Select Xcode: #{XCODE_PATH}"
`sudo xcode-select -s #{XCODE_PATH}`
