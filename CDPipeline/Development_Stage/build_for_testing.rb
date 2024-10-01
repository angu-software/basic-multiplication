# frozen_string_literal: true

require_relative 'config'

BUILD_FOR_TESTING_COMMAND = "#{BUILD_TOOL} build-for-testing -scheme '#{SCHEME}' -testPlan '#{TEST_PLAN}' -destination '#{BUILD_DESTINATION}' -derivedDataPath '#{DERIVED_DATA}' -testProductsPath '#{ARTIFACTS_PATH}' #{TEST_CODE_SIGNING_SETTINGS}"

def self.build_for_testing
  puts "Build for testing: #{BUILD_DESTINATION}"
  CommandRunner.run(BUILD_FOR_TESTING_COMMAND)
end

build_for_testing if __FILE__ == $PROGRAM_NAME
