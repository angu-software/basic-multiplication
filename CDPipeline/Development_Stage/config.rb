# frozen_string_literal: true

require_relative 'git_info'

module DevelopmentStage
  module Config
    BUILD_ID = GitInfo.git_commit_sha(short: true)
    private_constant :BUILD_ID

    ARTIFACT_NAME = "Basic_Multiplication_#{BUILD_ID}".freeze
    private_constant :ARTIFACT_NAME

    BUILD_PATH = '__builds__'
    private_constant :BUILD_PATH

    PRODUCTS_PATH = "#{BUILD_PATH}/Products/#{ARTIFACT_NAME}".freeze
    private_constant :PRODUCTS_PATH

    RC_TAG_PREFIX = 'Staged-RC-'

    XCODE_PATH = '/Applications/Xcode_16.app'

    BUILD_TOOL = 'xcodebuild'
    SCHEME = 'Basic Multiplication'
    TEST_PLAN = 'DevelopmentTests'
    TEST_BUILD_DESTINATION = 'generic/platform=iOS Simulator'
    TEST_DESTINATION = 'platform=iOS Simulator,name=iPhone 16 Pro'
    TEST_CODE_SIGNING_SETTINGS = "CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY='' CODE_SIGNING_ALLOWED=NO"

    DERIVED_DATA = "#{BUILD_PATH}/Derived_Data/#{ARTIFACT_NAME}".freeze
    ARTIFACTS_PATH = "#{PRODUCTS_PATH}/Test_build.xctestproducts".freeze
    BUILD_RESULTS_PATH = "#{PRODUCTS_PATH}/Build_results.xcresult".freeze
    TEST_RESULTS_PATH = "#{PRODUCTS_PATH}/Test_results.xcresult".freeze
  end
end

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
