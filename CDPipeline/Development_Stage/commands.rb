# frozen_string_literal: true

require_relative 'config'

# TODO: resolve those conststants

BUILD_TOOL = DevelopmentStage::Config::BUILD_TOOL

SCHEME = DevelopmentStage::Config::SCHEME
TEST_PLAN = DevelopmentStage::Config::TEST_PLAN
TEST_BUILD_DESTINATION = DevelopmentStage::Config::TEST_BUILD_DESTINATION
TEST_DESTINATION = DevelopmentStage::Config::TEST_DESTINATION
TEST_CODE_SIGNING_SETTINGS = DevelopmentStage::Config::TEST_CODE_SIGNING_SETTINGS

DERIVED_DATA = DevelopmentStage::Config::DERIVED_DATA
ARTIFACTS_PATH = DevelopmentStage::Config::ARTIFACTS_PATH
BUILD_RESULTS_PATH = DevelopmentStage::Config::BUILD_RESULTS_PATH
TEST_RESULTS_PATH = DevelopmentStage::Config::TEST_RESULTS_PATH

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
