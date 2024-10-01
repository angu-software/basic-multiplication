# frozen_string_literal: true

require_relative 'config'

TEST_WITHOUT_BUILDING_COMMAND = <<~CMD.freeze
  #{BUILD_TOOL} \
  test-without-building \
  -destination '#{TEST_DESTINATION}' \
  -testProductsPath '#{ARTIFACTS_PATH}' \
  -resultBundlePath '#{TEST_RESULTS_PATH}'
CMD

def self.test_without_building
  puts "Test without building: #{TEST_DESTINATION}"
  run_command(TEST_WITHOUT_BUILDING_COMMAND)
end

test_without_building if __FILE__ == $PROGRAM_NAME
