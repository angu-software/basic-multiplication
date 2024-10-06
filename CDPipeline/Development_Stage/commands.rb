# frozen_string_literal: true

require_relative 'config'

module DevelopmentStage
  module Commands
    def self.build_tool
      DevelopmentStage::Config::BUILD_TOOL
    end

    BUILD_FOR_TESTING_COMMAND = <<~CMD.freeze
      #{build_tool} \
      build-for-testing \
      -scheme '#{Config::SCHEME}' \
      -testPlan '#{Config::TEST_PLAN}' \
      -destination '#{Config::TEST_BUILD_DESTINATION}' \
      -derivedDataPath '#{Config::DERIVED_DATA}' \
      -testProductsPath '#{Config::ARTIFACTS_PATH}' \
      -resultBundlePath '#{Config::BUILD_RESULTS_PATH}' \
      #{Config::TEST_CODE_SIGNING_SETTINGS}
    CMD

    TEST_WITHOUT_BUILDING_COMMAND = <<~CMD.freeze
      #{build_tool} \
      test-without-building \
      -destination '#{Config::TEST_DESTINATION}' \
      -testProductsPath '#{Config::ARTIFACTS_PATH}' \
      -resultBundlePath '#{Config::TEST_RESULTS_PATH}'
    CMD

    def self.select_xcode(path:)
      "sudo xcode-select -s #{path}"
    end
  end
end
