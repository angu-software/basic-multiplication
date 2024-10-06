# frozen_string_literal: true

require_relative 'git_info'

module DevelopmentStage
  module Config
    RC_TAG_PREFIX = 'Staged-RC-'

    XCODE_PATH = '/Applications/Xcode_16.app'

    BUILD_TOOL = 'xcodebuild'
    SCHEME = 'Basic Multiplication'
    TEST_PLAN = 'DevelopmentTests'
    TEST_BUILD_DESTINATION = 'generic/platform=iOS Simulator'
    TEST_DESTINATION = 'platform=iOS Simulator,name=iPhone 16 Pro'
    TEST_CODE_SIGNING_SETTINGS = "CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY='' CODE_SIGNING_ALLOWED=NO"

    BUILD_ID = GitInfo.git_commit_sha(short: true)
    BUILD_PATH = File.join('.xcpipeline', BUILD_ID)
    DERIVED_DATA = File.join(BUILD_PATH, 'derived_data')
    ARTIFACTS_PATH = File.join(BUILD_PATH, 'artifacts')
    BUILD_RESULT_BUNDLE_PATH = File.join(ARTIFACTS_PATH, 'build_result_bundle.xcresult')
    TESTING_RESULT_BUNDLE_PATH = File.join(ARTIFACTS_PATH, 'testing_result_bundle.xcresult')
    TEST_PRODUCTS_PATH = File.join(ARTIFACTS_PATH, 'test_products.xctestproducts')

    private_constant :BUILD_ID
    private_constant :BUILD_PATH
  end
end
