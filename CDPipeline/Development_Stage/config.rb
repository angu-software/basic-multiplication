# frozen_string_literal: true

require_relative 'git_info'

BUILD_ID = GitInfo.git_commit_sha(short: true)

XCODE_PATH = '/Applications/Xcode_16.app'

BUILD_TOOL = 'xcodebuild'
SCHEME = 'Basic Multiplication'
TEST_PLAN = 'DevelopmentTests'
BUILD_DESTINATION = 'generic/platform=iOS Simulator'
TEST_DESTINATION = 'platform=iOS Simulator,name=iPhone 16 Pro'
TEST_CODE_SIGNING_SETTINGS = "CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY='' CODE_SIGNING_ALLOWED=NO"

ARTIFACT_NAME = "Basic_Multiplication_#{BUILD_ID}".freeze
BUILD_PATH = '__builds__'
DERIVED_DATA = "#{BUILD_PATH}/Derived_Data/#{ARTIFACT_NAME}".freeze
PRODUCTS_PATH = "#{BUILD_PATH}/Products/#{ARTIFACT_NAME}".freeze
ARTIFACTS_PATH = "#{PRODUCTS_PATH}/Test_build.xctestproducts".freeze
BUILD_RESULTS_PATH = "#{PRODUCTS_PATH}/Build_results.xcresult".freeze
TEST_RESULTS_PATH = "#{PRODUCTS_PATH}/Test_results.xcresult".freeze
