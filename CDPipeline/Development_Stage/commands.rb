# frozen_string_literal: true

require_relative 'config'

module DevelopmentStage
  module Commands
    def self.build_for_testing(build_tool: Config::BUILD_TOOL,
                               scheme: Config::SCHEME,
                               test_plan: Config::TEST_PLAN,
                               destination: Config::TEST_BUILD_DESTINATION,
                               derived_data_path: Config::DERIVED_DATA,
                               test_products_path: Config::ARTIFACTS_PATH,
                               result_bundle_path: Config::BUILD_RESULTS_PATH,
                               code_signing_settings: Config::TEST_CODE_SIGNING_SETTINGS)
      <<~CMD.freeze
        #{build_tool} \
        build-for-testing \
        -scheme '#{scheme}' \
        -testPlan '#{test_plan}' \
        -destination '#{destination}' \
        -derivedDataPath '#{derived_data_path}' \
        -testProductsPath '#{test_products_path}' \
        -resultBundlePath '#{result_bundle_path}' \
        #{code_signing_settings}
      CMD
    end

    def self.test_without_building(build_tool: Config::BUILD_TOOL,
                                   destination: Config::TEST_DESTINATION,
                                   test_products_path: Config::ARTIFACTS_PATH,
                                   result_bundle_path: Config::TEST_RESULTS_PATH)
      <<~CMD.freeze
        #{build_tool} \
        test-without-building \
        -destination '#{destination}' \
        -testProductsPath '#{test_products_path}' \
        -resultBundlePath '#{result_bundle_path}'
      CMD
    end

    def self.select_xcode(path:)
      "sudo xcode-select -s #{path}"
    end
  end
end
