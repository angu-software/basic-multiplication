# frozen_string_literal: true

require_relative 'config'

TEST_WITHOUT_BUILDING_COMMAND = "#{BUILD_TOOL} test-without-building -destination '#{TEST_DESTINATION}' -testProductsPath '#{ARTIFACTS_PATH}' -resultBundlePath '#{TEST_RESULTS_PATH}'"

puts "Test without building: #{TEST_DESTINATION}"
CommandRunner.run(TEST_WITHOUT_BUILDING_COMMAND)
