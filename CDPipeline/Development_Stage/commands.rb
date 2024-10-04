# frozen_string_literal: true

require_relative 'config'

module DevelopmentStage
  module Commands
    BUILD_FOR_TESTING_COMMAND = <<~CMD.freeze
      #{BUILD_TOOL} \
      build-for-testing \
      -scheme '#{SCHEME}' \
      -testPlan '#{TEST_PLAN}' \
      -destination '#{TEST_BUILD_DESTINATION}' \
      -derivedDataPath '#{DERIVED_DATA}' \
      -testProductsPath '#{ARTIFACTS_PATH}' \
      -resultBundlePath '#{BUILD_RESULTS_PATH}' \
      #{TEST_CODE_SIGNING_SETTINGS}
    CMD

    TEST_WITHOUT_BUILDING_COMMAND = <<~CMD.freeze
      #{BUILD_TOOL} \
      test-without-building \
      -destination '#{TEST_DESTINATION}' \
      -testProductsPath '#{ARTIFACTS_PATH}' \
      -resultBundlePath '#{TEST_RESULTS_PATH}'
    CMD

    def self.select_xcode(path:)
      "sudo xcode-select -s #{path}"
    end
  end
end
